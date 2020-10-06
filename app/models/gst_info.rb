class GstInfo < ApplicationRecord
  belongs_to :vendor_application
  has_one_attached :pan_card_doc
  validates :pan_card, :pan_card_doc, :is_organization_registered, :is_gst_exempted, :is_turonover_below_par, presence: true
  validates :gst_no, :registered_email, :address_line_1, :address_line_2, :state, :pin_code, 	presence: true, if: Proc.new { |a| 
  	a.is_organization_registered == YES || a.is_gst_exempted == YES || a.is_turonover_below_par == YES
  }
  
  YES=1
  NO=0
  
  DROPDOWN_OPTIONS = [['Yes', YES], ['No', NO]]

  def is_gst_number_present?
  	is_organization_registered == YES || is_gst_exempted == YES || is_turonover_below_par == YES
  end
end
