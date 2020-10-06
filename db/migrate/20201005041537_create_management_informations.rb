class CreateManagementInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :management_informations do |t|
      t.integer :key_contact
      t.string :name
      t.string :designation
      t.string :landline
      t.string :mobile
      t.string :email
      t.string :pan_card
      t.string :aadar_card
      t.belongs_to :vendor_application, null: false, foreign_key: true

      t.timestamps
    end
  end
end
