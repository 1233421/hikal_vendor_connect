class VendorApplication < ApplicationRecord
  belongs_to :user
  has_one :general_information
  has_one :company_information
  has_one :management_information
  has_one :gst_info
  has_one :statutory_detail
  has_one :bank_detail
end
