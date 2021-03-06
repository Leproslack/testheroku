class Pin < ActiveRecord::Base
  validates :title, :description, :image,  presence: true
  
  acts_as_votable
  
  belongs_to :user
  has_many :comments, as: :commentable

  has_attached_file :image, styles: {medium: "640x"}
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
