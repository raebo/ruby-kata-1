class Product < ApplicationRecord
  has_and_belongs_to_many :authors, join_table: 'authors_products'

  validates :title, :isbn, presence: true
  validates :isbn, uniqueness: true
end
