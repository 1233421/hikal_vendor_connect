class CreateCompanyInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :company_informations do |t|
      t.integer :company_presentation
      t.string :company_presentation_doc
      t.integer :credit_rating
      t.string :credit_rating_doc
      t.integer :product_catelogue
      t.string :product_catelogue_doc
      t.integer :manufactoring_facilities
      t.string :manufactoring_facilities_doc
      t.integer :quality_assurance_plan
      t.string :quality_assurance_plan_doc
      t.integer :iso_9001
      t.string :iso_9001_doc
      t.integer :iso_14000
      t.string :iso_14000_doc
      t.integer :iso_27000
      t.string :iso_27000_doc
      t.integer :ohsas
      t.string :ohsas_doc
      t.integer :indian_boiler_regulations
      t.string :indian_boiler_regulations_doc
      t.integer :asme
      t.string :asme_doc
      t.integer :pressure_equipment_directive
      t.string :pressure_equipment_directive_doc
      t.integer :underwriters_labs
      t.string :underwriters_labs_doc
      t.integer :customer_approval
      t.string :customer_approval_doc
      t.integer :sample_test
      t.string :sample_test_doc
      t.integer :customer_reference
      t.string :customer_reference_doc
      t.integer :incorporation_certificate
      t.string :incorporation_certificate_doc
      t.integer :legal_cases
      t.string :legal_cases_doc
      t.integer :annual_turnover
      t.string :annual_turnover_doc
      t.belongs_to :vendor_application, null: false, foreign_key: true

      t.timestamps
    end
  end
end
