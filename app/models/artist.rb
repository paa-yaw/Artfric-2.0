class Artist < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :artworks, dependent: :destroy
  has_many :comments

  has_attached_file :profile_pic, styles:  { medium: "700x500>", thumb: "80x80>" }
  validates_attachment_content_type :profile_pic, content_type: /\Aimage\/.*\Z/
end
