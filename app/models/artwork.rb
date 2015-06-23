class Artwork < ActiveRecord::Base
  acts_as_votable
  has_many :comments, dependent: :destroy
  belongs_to :artist
  has_attached_file :image, styles:  { medium: "700x500>", small: "350x250#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :title, presence: true,
            length: {minimum: 2}

  validates :content, presence: true,
            length: {minimum: 5}

  validates :image, presence: true
end
