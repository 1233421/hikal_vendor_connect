class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  enum role: [ :admin, :employee, :vendor ]
  
  validates :first_name, presence: true, if: :is_employee_or_vendor?
  validates :last_name, presence: true, if: :is_employee_or_vendor?
  validates :employee_number, presence: true, if: :is_employee?
  validates :department, presence: true, if: :is_employee?
  validates :division, presence: true, if: :is_employee_or_vendor?
  validates :employee_position, presence: true, if: :is_employee?
  validates :site_name, presence: true, if: :is_vendor?
  
  has_one :vendor_application
  has_one :general_information, through: :vendor_application
  has_one :company_information, through: :vendor_application
  has_one :management_information, through: :vendor_application
  has_one :gst_info, through: :vendor_application
  has_one :statutory_detail, through: :vendor_application
  has_one :bank_detail, through: :vendor_application
  
  def is_employee?
    self.employee?
  end
  
  def is_employee_or_vendor?
    self.employee? || self.vendor?
  end
  
  def is_vendor?
    self.vendor?
  end
  
  def send_invite_to_user
    UserMailer.welcome_reset_password_instructions(self).deliver
  end
  
end
