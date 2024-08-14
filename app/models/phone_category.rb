class PhoneCategory < ApplicationRecord
  self.table_name = 'Phone_category'
  has_many :phones, foreign_key: 'category_id', class_name: 'Phone'
end
