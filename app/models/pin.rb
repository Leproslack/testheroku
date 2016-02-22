class Pin < ActiveRecord::Base
  validates :title, :description, presence: true

  belongs_to :user

  has_attached_file :image, styles: {medium: "300x300>"}
  #validates_attachment_content_type :iamge, content_type: /\Aimage\/.*\Z/
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
end
