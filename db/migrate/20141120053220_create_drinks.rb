class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|

      t.timestamps
    end
  end
end
