class BankDetail < ApplicationRecord
  belongs_to :vendor_application
  has_one_attached :canceled_cheque
  
  attr_accessor :repeat_account_number
end
