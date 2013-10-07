class ViewsController < ApplicationController
  def index
    @user = User.find_or_create_by_id(cookies[:notacms])
    cookies[:notacms] = @user.id
    @contents = @user.positions.map {|position| Content.get_meme(position.content, cookies[:notacms])}
    @menus = Menu.all
  end
end
