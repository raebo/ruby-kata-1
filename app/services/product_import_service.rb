require 'csv'

class ProductImportService
  def self.import(product_type:, file:)
    CSV.foreach(file.path, headers: true) do |raw_row|
      row = raw_row.to_s.split(';')
      product = if product_type == :magazine
                  Magazine.create!(
                    title: row[0],
                    isbn: row[1],
                    description: row[3]
                  )
                elsif product_type == :book
                  Book.create!(
                    title: row[0],
                    isbn: row[1],
                    description: row[3]
                  )
                end

      if row[2].index(',')
        row[2].split(',').each do |email|
          author = Author.find_by_email(row[2])
          product.authors << author if author && product
        end
      else
        author = Author.find_by_email(row[2])
        product.authors << author if author && product
      end

    rescue ActiveRecord::ActiveRecordError => error
      Rails.logger.error "Error during product save #{error}"
    end
  end
end
