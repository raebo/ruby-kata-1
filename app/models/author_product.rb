class AuthorProduct < ActiveRecord::Base
  belongs_to :author
  belongs_to :product
end
