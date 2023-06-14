class CreateExtracts < ActiveRecord::Migration[7.0]
  def change
    create_table :extracts do |t|
      t.float :value
      t.string :transaction_type
      t.references :wallet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
