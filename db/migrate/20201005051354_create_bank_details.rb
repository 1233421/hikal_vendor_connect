class CreateBankDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :bank_details do |t|
      t.string :account_number
      t.string :account_type
      t.string :bank_name
      t.string :bank_code
      t.string :branch_name
      t.string :bank_address
      t.string :ifsc_code
      t.string :canceled_cheque
      t.belongs_to :vendor_application, null: false, foreign_key: true

      t.timestamps
    end
  end
end
