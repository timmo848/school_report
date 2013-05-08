class Topic < ActiveRecord::Base
  attr_accessible :content, :region, :school_name, :school_type, :title
  
  belongs_to :user
  has_many :replies
  
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true
  
  default_scope order: 'topics.created_at DESC'
end
