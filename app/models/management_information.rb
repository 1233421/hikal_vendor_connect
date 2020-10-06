class ManagementInformation < ApplicationRecord
  belongs_to :vendor_application
  validates :key_contact, :name, :designation, :mobile, :email, :pan_card, :aadar_card, 	presence: true
end
