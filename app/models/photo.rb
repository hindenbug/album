class Photo < ActiveRecord::Base
  
  cattr_reader :per_page

  belongs_to :album
  acts_as_taggable_on :tags
 # belongs_to :user
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  validates :title,:presence => true
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes
  
  def self.destroy_pics(album,photos)
    @del= Photo.find(photos,:conditions => {"album_id" => album} ).each(&:destroy)
  end
  
end
