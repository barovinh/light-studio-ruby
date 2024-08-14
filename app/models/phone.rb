class Phone < ApplicationRecord
  self.table_name = 'phones'
  belongs_to :phone_category, class_name: 'PhoneCategory', foreign_key: 'category_id'
  has_many :phone_details, class_name: 'PhoneDetail', foreign_key: 'phone_id'

  def primary_phone_detail
    phone_details.first
  end
  
end
