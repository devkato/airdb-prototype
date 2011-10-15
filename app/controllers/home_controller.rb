class HomeController < ApplicationController

  before_filter :authenticate_user!, :only => [:secret]

  def index
    if current_user
      render :dashboard
    else
      render :index
    end
  end

  def secret
  end
end
