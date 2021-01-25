class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.text :message
      t.belongs_to :help
      t.timestamps
    end
  end
end
