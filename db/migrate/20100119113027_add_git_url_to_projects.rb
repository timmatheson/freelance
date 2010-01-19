class AddGitUrlToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :git_url, :string
  end

  def self.down
    remove_column :projects, :git_url
  end
end
