class AddQualityToFood < ActiveRecord::Migration
  def up
    remove_column :foods, :quality, :integer
  end

  def down
    add_column :foods, :quality
  end
end
