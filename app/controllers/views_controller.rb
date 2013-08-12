class ViewsController < ApplicationController
  def index
    @user = User.find_or_create_by_id(cookies[:notacms])
    cookies[:notacms] = @user.id
    @pages = []
  end
end
