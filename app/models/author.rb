class Author < ApplicationRecord
  has_and_belongs_to_many :products

  validates :email, :prename, :lastname, presence: true
  validates :email, uniqueness: true
end
