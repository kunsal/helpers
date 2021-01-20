class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name
      # t.string :description
      t.integer :help_id
      t.timestamps
    end
  end
end
