class Album < ActiveRecord::Base
  
  has_many :photos,:dependent => :destroy
  belongs_to :user
  
  accepts_nested_attributes_for :photos
  
end
