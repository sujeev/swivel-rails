class AddStateToCategory < ActiveRecord::Migration[7.1]
  def change
    add_column :categories, :state, :integer, default: 0
  end
end
