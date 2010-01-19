class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :crypted_password
      t.string :persistence_token
      t.string :email
      t.string :mobile_phone
      t.string :phone
      t.timestamps
    end
  end
  
  def self.down
    drop_table :users
  end
end
