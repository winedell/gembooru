class Comment < ApplicationRecord
  attr_accessor :creator_ip_addr

  belongs_to :post
  belongs_to :creator, class_name: "User"
  belongs_to :updater, class_name: "User", default: -> { creator }
  
end