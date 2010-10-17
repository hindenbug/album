class HomeController < ApplicationController
  
  def index
    @albums = Album.all
    @tags = []
    @albums.each do |a|
      a.photos.each do |p|
        @tags << p.tag_list
      end
    end
    
  end
  
  
  
end
