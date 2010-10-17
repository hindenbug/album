class AlbumsController < ApplicationController
  respond_to :html,:xml
  before_filter :load, :only => [:show,:edit,:update,:destroy,:tag_cloud]
  before_filter :authenticate_user!
  
    
  def index
    
    
    @albums = Album.paginate(:all,:page => params[:page])
    
    respond_with(@albums)
     
  end

  
  def show
    @photos = @album.photos.paginate(:all,:page => params[:page],:per_page => 6)
    respond_with(@album)
      
  end

  
  def new
    @album = Album.new
    respond_with(@album)
  end

  
  def edit
   
  end

  
  def create
    @album = Album.create(params[:album])
   
    respond_to do |format|
      if @album.save
        format.html { redirect_to(@album, :notice => 'Album was successfully created.') }
        format.xml  { render :xml => @album, :status => :created, :location => @album }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @album.errors, :status => :unprocessable_entity }
      end
    end
  end

  
  def update
       
    respond_to do |format|
      if @album.update_attributes(params[:album])
        format.html { redirect_to(@album, :notice => 'Album was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @album.errors, :status => :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to(albums_url) }
      format.xml  { head :ok }
    end
  end
  
 
  
  private
  
  def load
    
    @album = Album.find(params[:id])
  end
  
  
  
end
