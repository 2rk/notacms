class Content < ActiveRecord::Base
  attr_accessible :content, :position, :title, :top, :left, :width, :height
  attr_accessor :position_id

  PAGE_NOT_FOUND = {top: 100, left: 100, width: 200, height: 100, title: 'Page not found', content: 'Page not found'}

  has_many :positions

  def self.get_meme content_id, user_id
    user = User.find_by_id(user_id)
    if user
      content = Content.find_by_id(content_id)
      if content
        position = Position.find_by_user_id_and_content_id(user.id, content.id)
        if position
          content.top = position.top
          content.left = position.left
          content.width = position.width
          content.height = position.height
        else
          position = Position.create(user_id: user.id, content_id: content.id, top: content.top, left: content.left, width: content.width, height: content.height)
          content.position_id = position.id
        end
        content.attributes.merge('position_id' => position.id)
      else
        PAGE_NOT_FOUND
      end
    end
  end
end
