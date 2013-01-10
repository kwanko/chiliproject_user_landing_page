#-- encoding: UTF-8
# User landing page plugin for Chiliproject
# Copyright (C) 2011 Arnauld NYAKU


class CreateUserLandingPageSettings < ActiveRecord::Migration
  def self.up
    create_table :user_landing_page_settings do |t|
      t.column :page_name, :string
      t.column :page_url, :string
      t.column :visible, :boolean
      t.column :created_at, :timestamp
      t.column :updated_at, :timestamp

    end
  end

  def self.down
    drop_table :user_landing_page_settings
  end
end
