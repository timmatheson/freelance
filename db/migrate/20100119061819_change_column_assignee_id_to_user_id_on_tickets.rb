class ChangeColumnAssigneeIdToUserIdOnTickets < ActiveRecord::Migration
  def self.up
    rename_column :tickets, :assignee_id, :user_id
  end

  def self.down
    rename_column :tickets, :user_id, :assignee_id
  end
end
