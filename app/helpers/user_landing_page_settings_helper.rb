#-- encoding: UTF-8
module UserLandingPageSettingsHelper
  def change_page_status_link(user_page)
        url = {:controller => 'user_landing_page_settings', :action => 'update', :id => user_page, :page => params[:page], :status => params[:status], :tab => 'user_landing_pages'}

        if user_page.status?
          link_to l(:button_unlock), url.merge(:user_page => {:status => user_page::STATUS_VISIBLE}), :method => :put, :class => 'icon icon-unlock'
        else
          link_to l(:button_activate), url.merge(:user_page => {:status => user_page::STATUS_HIDDEN}), :method => :put, :class => 'icon icon-lock'
        end
   end
end
