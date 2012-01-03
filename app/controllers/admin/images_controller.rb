class Admin::ImagesController < Admin::AdminController
  inherit_resources

  def update
    @image = Image.find(params[:id])
    @image.attributes = params[:image]
    if @image.save_and_process_attachment({:now => false})
      flash[:notice] = "Image being updated"
      redirect_to :action => :show
    else
      render :edit
    end
  end

 def create
    @image = Image.new(params[:image])
    if @image.save_and_process_attachment({:now => false})
      flash[:notice] = "Image being created"
      redirect_to :action => :index
    else
      puts @image.errors.inspect
      render :new
    end
  end
end
