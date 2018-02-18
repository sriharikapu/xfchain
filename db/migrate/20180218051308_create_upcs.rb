class CreateUpcs < ActiveRecord::Migration[5.1]
  def change
    create_table :upcs do |t|
      t.string :name, required: true, null: false

      t.timestamps
    end
  end
end
