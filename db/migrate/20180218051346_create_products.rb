class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.integer :upc_id
      t.integer :contract_id
      t.string :wallet_key
      t.string :public_id, index: {unique: true}
      t.string :public_key, index: {unique: true}
      t.string :private_key, index: {unique: true}

      t.timestamps
    end
  end
end
