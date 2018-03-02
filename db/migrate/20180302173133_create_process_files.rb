class CreateProcessFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :process_files do |t|
      t.integer :type_transaction
      t.datetime :date
      t.decimal :value
      t.string :cpf
      t.string :card
    end
  end
end
