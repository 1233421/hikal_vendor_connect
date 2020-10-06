class GeneralInformation < ApplicationRecord
  belongs_to :vendor_application
  validates :correspondence_pin_code, format: { with: /\A\d+\z/ }
  validates :shipping_pin_code, format: { with: /\A\d+\z/ }
  validates :office_pin_code, format: { with: /\A\d+\z/ }
  validates :vendor_type, :vendor_sub_type, :nature_of_the_entity, :annual_sales, :list_of_products, :correspondence_address_line_1, :correspondence_address_line_2, :correspondence_city, :correspondence_state, :correspondence_country, :correspondence_pin_code, :shipping_address_line_1, :shipping_address_line_2, :shipping_city, :shipping_state, :shipping_country, :shipping_pin_code, :office_address_line_1, :office_address_line_2, :office_city, :office_state, :office_country, :office_pin_code, presence: true
end
