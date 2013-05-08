class Reply < ActiveRecord::Base
  attr_accessible :content
  
  belongs_to :topic
  
  validates :topic_id, presence: true
end
