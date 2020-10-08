class VendorApplication < ApplicationRecord
  belongs_to :user
  has_one :general_information
  has_one :company_information
  has_one :management_information
  has_one :gst_info
  has_one :statutory_detail
  has_one :bank_detail
  has_many :rejections

  def is_rejected?
  	submitted_at.present? && rejections.present? && rejections.last.created_at > submitted_at
  end

  def wating_for_first_level?
  	!is_rejected? && is_submitted_for_approval && !is_approved_by_first_level
  end

  def wating_for_second_level?
  	!is_rejected? && is_submitted_for_approval && is_approved_by_first_level && !is_approved_by_second_level
  end

  def is_approved?
  	submitted_at.present? && is_submitted_for_approval && is_approved_by_first_level && is_approved_by_second_level
  end
end
