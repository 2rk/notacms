class Page < ActiveRecord::Base
  attr_accessible :content, :position, :title, :top, :left, :width, :height
  #attr_accessor :follower_id

  has_many :positions

end
