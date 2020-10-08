class AddRejectionToVendorApplications < ActiveRecord::Migration[6.0]
  def change
    add_column :vendor_applications, :rejected_at, :datetime
    add_column :vendor_applications, :reason, :text
    add_column :vendor_applications, :number_of_rejection, :integer
  end
end
