class AddSubmissionToVendorApplications < ActiveRecord::Migration[6.0]
  def change
    add_column :vendor_applications, :submitted_at, :datetime
  end
end
