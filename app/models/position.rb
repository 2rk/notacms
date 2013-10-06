class Position < ActiveRecord::Base
  belongs_to :content
  belongs_to :user
  attr_accessible :height, :left, :minimised, :top, :width, :user_id, :content_id
end
