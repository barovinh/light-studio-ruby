class PhoneColor < ApplicationRecord
  self.table_name = 'phone_colors'
  belongs_to :phones, class_name: "Phone" , foreign_key: "phone_id"
  has_many :phone_details, class_name: 'PhoneDetail', foreign_key: 'color_id'
end
