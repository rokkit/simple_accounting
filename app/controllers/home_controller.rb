class HomeController < ApplicationController
  def index
    @users = User.all
  end

  def fake

  end
end
