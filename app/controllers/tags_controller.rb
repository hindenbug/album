class TagsController < ApplicationController
  
  def index
    
    @album = Album.find(params[:id])
    @tags = @album.photos.tag_counts
  end
      
  end
  
  def show
   
    @album = Album.find(params[:id])
    
    @photos = @album.photos.find_tagged_with(params[:id])
  end
end