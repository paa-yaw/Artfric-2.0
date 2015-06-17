class Comment < ActiveRecord::Base
  belongs_to :artwork
  belongs_to :artist
end
