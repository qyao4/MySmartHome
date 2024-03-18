class StaticPagesController < ApplicationController

  def contact_us
    @contact_info = ContactInfo.first
  end

  def about_us
    @page = StaticPage.find_by(title: 'About Us')
  end

end
