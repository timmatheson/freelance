class CreateUsers < ActiveRecord::Migration
  require 'digest/md5'
  
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
    
    password = "uIbj78SvsbKuiCsUs87csjh76w"
    User.create(
      :username => "admin", 
      :password => password, 
      :password_confirmation => password,
      :email => "me@timmatheson.com",
      :phone => "9492945624",
      :mobile_phone => "9492945624"
    )
  end
  
  def self.down
    drop_table :users
  end
end
