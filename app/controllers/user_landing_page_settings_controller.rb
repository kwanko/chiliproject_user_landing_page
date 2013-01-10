#-- encoding: UTF-8
# User landing page plugin for Chiliproject
# Copyright (C) 2011 Arnauld NYAKU
class UserLandingPageSettingsController < ApplicationController
  unloadable
  layout 'admin'
 def index
   redirect_to :controller => 'settings', :action => 'edit', :tab => 'user_landing_pages'
 end

 def new
   @user_landing_page_setting = UserLandingPageSetting.new
   @guessed_host = 'http://' + request.host + '/projects'
   respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user_landing_page_setting  }
    end
 end

  def create
    @user_landing_page_setting = UserLandingPageSetting.new(params[:user_landing_page_setting])

     respond_to do |format|
      if @user_landing_page_setting.save
        flash[:notice] = l(:notice_successful_create)
        format.html { redirect_to :controller => 'settings', :action => 'edit', :tab => 'user_landing_pages'}
        format.xml  { render :xml => @user_landing_page_setting, :status => :created, :location => @user_landing_page_setting }
      else
        format.html { render :action => 'new' }
        format.xml  { render :xml => @user_landing_page_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @user_landing_page_setting = UserLandingPageSetting.find(params[:id])
    @guessed_host = 'http://' + request.host + '/projects'
  end

  def update
    @user_landing_page_setting = UserLandingPageSetting.find(params[:id])

    respond_to do |format|
      if  @user_landing_page_setting.update_attributes(params[:user_landing_page_setting])
        flash[:notice] = l(:notice_successful_update)
        format.html { redirect_to( user_landing_page_settings_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml =>  @user_landing_page_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @user_landing_page_setting = UserLandingPageSetting.find(params[:id])
    @user_landing_page_setting.destroy

    respond_to do |format|
      format.html { redirect_to(user_landing_page_settings_url) }
      format.xml  { head :ok }
    end
  end

  def is_app_validate_url?(a_url)
    uri = URI.parse(a_url)
    return true if (uri.host == request.host) && Net::HTTP.get_response(uri).code == 200
    false
  end
end
