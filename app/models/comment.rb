class Comment < ActiveRecord::Base
  belongs_to :artwork
  belongs_to :artist

  validates :content, presence: true,
            length: {minimum: 2}
end
