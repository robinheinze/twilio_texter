class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.integer :contact_id
      t.integer :message_id
    end
  end
end
