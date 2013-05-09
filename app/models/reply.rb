class Reply < ActiveRecord::Base
  attr_accessible :content, :user_id, :topic_id
  
  belongs_to :topic
  belongs_to :user
  validates :topic_id, presence: true
end
