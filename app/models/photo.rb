class Photo < ActiveRecord::Base
  
  belongs_to :album
  acts_as_taggable_on :tags
 # belongs_to :user
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  def self.destroy_pics(album,photos)
    @del= Photo.find(photos,:conditions => {"album_id" => album} ).each(&:destroy)
  end
  
end
