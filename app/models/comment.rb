class Comment < ActiveRecord::Base
  acts_as_votable
  belongs_to :commentable, polymorphic: true

end
