class Post < ActiveRecord::Base
  attr_accessible :name, :context, :title, :tag_list
  acts_as_taggable
  acts_as_commentable


  #after_create :send_new_post_email

 # validates :name, :presence => true
  validates :title, :presence => true,
  					:length => { :minimum => 5}

  has_many :comments, :dependent => :destroy
  #has_many :tags
  belongs_to :user

  accepts_nested_attributes_for :tags, :allow_destroy => true, :reject_if => proc { |attrs| attrs.all? {|k, v| v.blank?}}

  self.per_page = 2

end
