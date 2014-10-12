class PagesController < ApplicationController
  def home
  	if current_user
  		redirect_to boards_path
  	end
  end
end
