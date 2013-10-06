class ViewsController < ApplicationController
  def index
    @user = User.find_or_create_by_id(cookies[:notacms])
    cookies[:notacms] = @user.id
    @pages = @user.positions.map {|position| Page.get_meme(position.page, cookies[:notacms])}
  end
end
