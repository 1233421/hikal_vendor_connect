class CreateGstInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :gst_infos do |t|
      t.string :pan_card
      t.string :pan_card_doc
      t.integer :is_organization_registered
      t.integer :is_gst_exempted
      t.integer :is_turonover_below_par
      t.belongs_to :vendor_application, null: false, foreign_key: true
      t.string :state
      t.string :address_line_1
      t.string :address_line_2
      t.string :gst_no
      t.string :pin_code
      t.string :registered_email
      t.string :gst_certificate

      t.timestamps
    end
  end
end
