class CreateStatutoryDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :statutory_details do |t|
      t.string :service_tax_no
      t.string :service_tax_no_doc
      t.string :esic_no
      t.string :esic_no_doc
      t.string :vat_tin_no
      t.string :vat_tin_no_doc
      t.string :cst_tin_no
      t.string :cst_tin_no_doc
      t.string :pf_no
      t.string :pf_no_doc
      t.string :labour_license_no
      t.string :labour_license_no_doc
      t.integer :is_covered_under_msme
      t.date :msme_registered_date
      t.string :msme_type
      t.string :ca_certificate
      t.belongs_to :vendor_application, null: false, foreign_key: true

      t.timestamps
    end
  end
end
