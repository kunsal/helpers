class CreateHelp < ActiveRecord::Migration[6.0]
  def change
    create_table :helps do |t|
      t.string :title
      t.text :description
      t.integer :category_id
      t.integer :user_id
      t.string :location
      t.boolean :status, default: 0
      t.timestamps
    end
  end
end
