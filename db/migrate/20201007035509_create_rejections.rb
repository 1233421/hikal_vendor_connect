class CreateRejections < ActiveRecord::Migration[6.0]
  def change
    create_table :rejections do |t|
      t.text :reason
      t.belongs_to :vendor_application, null: false, foreign_key: true

      t.timestamps
    end
  end
end
