class CreateVendorApplication < ActiveRecord::Migration[6.0]
  def change
    create_table :vendor_applications do |t|
      t.belongs_to :user
      t.string :current_step
      t.boolean :is_submitted_for_approval, default: false
      t.boolean :is_approved_by_first_level, default: false
      t.boolean :is_approved_by_second_level, default: false
      t.timestamps
    end
    
    create_table :general_informations do |t|
      t.integer :vendor_type
      t.integer :vendor_sub_type
      t.integer :nature_of_the_entity
      t.integer :annual_sales
      t.string :list_of_products
      
      t.string :correspondence_address_line_1
      t.string :correspondence_address_line_2
      t.string :correspondence_city
      t.string :correspondence_state
      t.string :correspondence_country
      t.string :correspondence_pin_code
      
      t.string :shipping_address_line_1
      t.string :shipping_address_line_2
      t.string :shipping_city
      t.string :shipping_state
      t.string :shipping_country
      t.string :shipping_pin_code
      
      t.string :office_address_line_1
      t.string :office_address_line_2
      t.string :office_city
      t.string :office_state
      t.string :office_country
      t.string :office_pin_code
      
      t.belongs_to :vendor_application
    end
  end
end
