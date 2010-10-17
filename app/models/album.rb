class Album < ActiveRecord::Base
   cattr_reader :per_page
   @@per_page = 6

  has_many :photos,:dependent => :destroy
  belongs_to :user
  
  accepts_nested_attributes_for :photos
  
end
