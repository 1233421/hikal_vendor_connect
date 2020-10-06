class CompanyInformation < ApplicationRecord
  belongs_to :vendor_application
  has_one_attached :company_presentation_doc
  has_one_attached :credit_rating_doc
  has_one_attached :product_catelogue_doc
  has_one_attached :manufactoring_facilities_doc
  has_one_attached :quality_assurance_plan_doc
  has_one_attached :iso_9001_doc
  has_one_attached :iso_14000_doc
  has_one_attached :ohsas_doc
  has_one_attached :iso_27000_doc
  has_one_attached :indian_boiler_regulations_doc
  has_one_attached :asme_doc
  has_one_attached :pressure_equipment_directive_doc
  has_one_attached :underwriters_labs_doc
  has_one_attached :customer_approval_doc
  has_one_attached :sample_test_doc
  has_one_attached :customer_reference_doc
  has_one_attached :incorporation_certificate_doc
  has_one_attached :legal_cases_doc
  has_one_attached :annual_turnover_doc

  validates :company_presentation, :credit_rating, :product_catelogue, :manufactoring_facilities, :quality_assurance_plan, :iso_9001, :iso_14000, :ohsas, :iso_27000, :indian_boiler_regulations, :asme, :pressure_equipment_directive, :underwriters_labs, :customer_approval, :sample_test, :customer_reference, :incorporation_certificate, :legal_cases, :annual_turnover, presence: true

  validates :company_presentation_doc, presence: true, if: Proc.new { |a| a.company_presentation == CompanyInformation::YES }
  validates :credit_rating_doc, presence: true, if: Proc.new { |a| a.credit_rating == CompanyInformation::YES }
  
  YES=1
  NO=0
  DROPDOWN_OPTIONS = [["Yes", YES], ["No", NO]]
end


class Array
  def get_by_key_from_2d_array(idx)
    each {|x| return x[0] if (x[1] == idx)} 
    return ""
  end
end