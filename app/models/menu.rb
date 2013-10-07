class Menu < ActiveRecord::Base
  belongs_to :content
  attr_accessible :name, :parent_id, :content

  def content_text
    name.blank? and content.try(:title).to_s or name
  end
end
