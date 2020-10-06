class StatutoryDetail < ApplicationRecord
  belongs_to :vendor_application
  has_one_attached :service_tax_no_doc
  has_one_attached :esic_no_doc
  has_one_attached :vat_tin_no_doc
  has_one_attached :cst_tin_no_doc
  has_one_attached :pf_no_doc
  has_one_attached :labour_license_no_doc
  has_one_attached :ca_certificate
end
