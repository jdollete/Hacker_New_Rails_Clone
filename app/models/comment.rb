class Comment < ApplicationRecord
  belongs_to :commentter, class_name: "User"
  belongs_to :post

  validates_presence_of :text
  
end
