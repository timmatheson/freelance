class CreateClientsContacts < ActiveRecord::Migration
  def self.up
    create_table :clients_contacts, :id => false do |t|
      t.integer :client_id
      t.integer :contact_id
    end
  end

  def self.down
    drop_table :clients_contacts
  end
end
