class Position < ActiveRecord::Base
  belongs_to :page
  belongs_to :user
  attr_accessible :height, :left, :minimised, :top, :width, :user_id
end
