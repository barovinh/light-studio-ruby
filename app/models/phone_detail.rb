class PhoneDetail < ApplicationRecord
self.table_name = 'phone_details'
belongs_to :phones
has_many :image, class_name: 'Image', foreign_key: 'phone_details_id'
belongs_to :phone_colors, class_name: 'PhoneColor', foreign_key: 'color_id'

  def primary_phone_color
      phone_colors
  end
end
