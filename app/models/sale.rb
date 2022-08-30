class Sale < ApplicationRecord
  belongs_to :buyer, :class_name => 'User'
  belongs_to :vendor, :class_name => 'User'
  has_and_belongs_to_many :products
end
