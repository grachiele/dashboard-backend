class AddColumnSwanson < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :swanson, :boolean
  end
end
