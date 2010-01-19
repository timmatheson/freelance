class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.integer :project_id
      t.integer :assignee_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :tickets
  end
end
