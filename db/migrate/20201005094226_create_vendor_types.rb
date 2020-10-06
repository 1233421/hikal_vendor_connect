class CreateVendorTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :vendor_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
