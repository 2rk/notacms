class ViewController < ApplicationController
  def index
    #Rails.logger.info cookies[:notacms]
    #cookies[:notacms] = 'helloworldmeme'
    @user = User.find_by_id(cookies[:notacms])
    unless  @user
      @user = User.create
      cookies[:notacms] = @user.id
    end
    @cookie = cookies[:notacms]
  end
end
