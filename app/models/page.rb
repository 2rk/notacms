class Page < ActiveRecord::Base
  attr_accessible :content, :position, :title, :top, :left, :width, :height
  attr_accessor :position_id

  PAGE_NOT_FOUND = {top: 100, left: 100, width: 200, height: 100, title: 'Page not found', content: 'Page not found'}

  has_many :positions

  def self.get_meme page_id, user_id
    user = User.find_by_id(user_id)
    if user
      page = Page.find_by_id(page_id)
      if page
        position = Position.find_by_user_id_and_page_id(user.id, page.id)
        if position
          page.top = position.top
          page.left = position.left
          page.width = position.width
          page.height = position.height
        else
          position = Position.create(user_id: user.id, page_id: page.id, top: page.top, left: page.left, width: page.width, height: page.height)
          page.position_id = position.id
        end
        page.attributes.merge('position_id' => position.id)
      else
        PAGE_NOT_FOUND
      end
    end
  end
end
