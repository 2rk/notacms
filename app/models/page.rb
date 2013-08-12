class Page < ActiveRecord::Base
  attr_accessible :content, :position, :title, :top, :left, :width, :height
  #attr_accessor :follower_id

  PAGE_NOT_FOUND = { top: 100, left: 100, width: 200, height: 100, title: 'Page not found', content: 'Page not found'}

  has_many :positions

  def self.get_page page_id, user_id
    user = User.find_by_id(user_id)
    if user

      position = user.positions.find_by_page_id(page_id) || position = user.positions.create(page_id: page_id) if Page.find_by_id(page_id)
    end
  end

end
