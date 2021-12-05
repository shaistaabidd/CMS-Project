class SubjectsController < ApplicationController
  layout 'admin'
  def index
    logger.debug("***Testing logger***")
    @subjects=Subject.sorted #Subject.all
    #@page_title="All subjects"
  end

  def show
    @subject = Subject.find(params[:id])
  end
 def showAllPages
  @pages=Subject.last.pages
 end
  def new
    @subject=Subject.new
    @subject_count=Subject.count+1
  end

  def create
    @subject= Subject.new(subject_params)
    if @subject.save
      flash[:notice] ="Subject created successfully......"
      redirect_to("/subjects")
    else
      @subject_count=Subject.count+1
      render('new')
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
    params.required(:subject).permit(:name,:position,:visible,:created_at)
  end
end
