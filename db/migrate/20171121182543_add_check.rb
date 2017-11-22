class AddCheck < ActiveRecord::Migration[5.1]
  def change
    add_column :lists, :check_box, :boolean
  end
end
