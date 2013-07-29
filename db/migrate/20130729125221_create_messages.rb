class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :content
      t.string :author
      t.string :kind
      t.string :url
      t.boolean :visible
      t.datetime :message_timestamp

      t.timestamps
    end
  end
end
