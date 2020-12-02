require 'csv'

class AuthorImportService

  def self.import(file:)
    CSV.foreach(file.path, headers: true) do |row|
      splitted = row.to_s.split(';')
      author = Author.new(
        email: splitted[0],
        prename: splitted[1],
        lastname: splitted[2].gsub('\n','')
      )

      author.save!
    rescue ActiveRecord::ActiveRecordError => error
      Rails.logger.error "Error during author save #{error}"
    end
  end

end
