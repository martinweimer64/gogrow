class User < ApplicationRecord
  has_many :sales, foreign_key: 'vendor_id', class_name: 'Sale'
  has_many :buys, foreign_key: 'buyer_id', class_name: 'Sale'
end
