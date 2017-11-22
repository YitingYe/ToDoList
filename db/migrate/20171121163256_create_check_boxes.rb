class CreateCheckBoxes < ActiveRecord::Migration[5.1]
  def change
    create_table :check_boxes do |t|
      t.boolean :check_box

      t.timestamps
    end
  end
end
