class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name
    end
    
    %w(admin developer client).each{ |r| Role.create(:name => r)}
  end

  def self.down
    drop_table :roles
  end
end
