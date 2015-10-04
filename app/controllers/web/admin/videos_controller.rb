class Web::Admin::VideosController < Web::Admin::ApplicationController
  def index
    @videos = {}
    @videos[:active] = Content::Video.active.page(params[:page]).decorate
    @videos[:unviewed] = Content::Video.unviewed.page(params[:page]).decorate
    @videos[:removed] = Content::Video.removed.page(params[:page]).decorate
    @videos[:search] = Content::Video.search_everywhere(params[:search]).page(params[:page]).decorate if params[:search]
  end

  def new
    @video_form = Content::VideoForm.new_with_model
  end

  def edit
    @video_form = Content::VideoForm.find_with_model params[:id]
  end

  def create
    @video_form = Content::VideoForm.new_with_model
    @video_form.submit(params[:video])
    if @video_form.save
      redirect_to admin_videos_path
    else
      render action: :new
    end
  end

  def update
    @video_form = Content::VideoForm.find_with_model params[:id]
    @video_form.submit(params[:video])
    if @video_form.save
      redirect_to edit_admin_video_path @video_form.model
    else
      render action: :edit
    end
  end

  def destroy
    @video = Content::Video.find params[:id]
    @video.remove
    redirect_to admin_videos_path
  end
end
