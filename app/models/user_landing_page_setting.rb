#-- encoding: UTF-8
# User landing page plugin for Chiliproject
# Copyright (C) 2011 Arnauld NYAKU
class UserLandingPageSetting < ActiveRecord::Base
  
  unloadable
  has_many :user_landing_pages, :dependent => :destroy
  has_many :users, :through => :user_landing_pages
  belongs_to :group
  validates_presence_of :page_name
  validates_uniqueness_of :page_name
  validates_presence_of :page_url
  validates_uniqueness_of :page_url
  validates_format_of :page_url, :with =>  /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix


end
