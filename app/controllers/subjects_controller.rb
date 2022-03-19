class SubjectsController < ApplicationController
 
  def index
    logger.debug("***Testing logger***")
    @subjects=Subject.sorted #Subject.all
    #@page_title="All subjects"
  end

  def show
    @subject = Subject.find(params[:id])
    respond_to :html, :js
  end
  def modal
    @subject = Subject.new
    
  end
 def showAllPages
  @pages=Subject.last.pages
 end
  def new
    @subject=Subject.new
    
  end
  def submit
    
    render :json => {
          :location => url_for(:controller => 'subjects', :action => 'new'),
          :flash => {:notice => "Subject created successfully......"}
        }
    
  end
  def create
    @subject= Subject.new(subject_params)
    respond_to do |format|
      if @subject.save

        flash[:notice] ="Subject created successfully......"
        format.html { redirect_to request.referer, notice: "Subject created successfully......"}
        format.js{}
        #redirect_to("/subjects")
      else
        @subject_count=Subject.count+1
        format.html { redirect_to request.referer, alert: "Something went wrong"}
        format.js{}
        #render('new')
      end
    end
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count=Subject.count
  end

  def update
    @subject = Subject.find(params[:id])

    if @subject.update(subject_params)
      flash[:notice] ="Subject Updated successfully......"
      redirect_to(subject_path(@subject)) #subjects_path
    else
      @subject_count=Subject.count
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] ="Subject Deleted successfully......"
    redirect_to(subjects_path)
  end
  
  private
  def subject_params
    p "\n\n\n\n"
    p params.require(:subject).permit(:name)
    mmmmmmm
    params.required(:subject).permit(:name,:position,:visible,:created_at,:zip_code)
  end
end
