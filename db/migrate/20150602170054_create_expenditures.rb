class CreateExpenditures < ActiveRecord::Migration
  def change
    create_table :expenditures do |t|
      t.string :item
      t.string :price
      t.attachment :image

      t.timestamps null: false
    end
  end
end
