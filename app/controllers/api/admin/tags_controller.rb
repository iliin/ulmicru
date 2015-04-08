class Api::Admin::TagsController < Api::Admin::ApplicationController
  def create
    @tag_form = TagForm.new_with_model
    @tag_form.submit params[:tag]
    if @tag_form.save
      render json: { target: @tag_form.model.target,
                     tag_id: @tag_form.model.id,
                     target_type: @tag_form.model.target_type }
    else
      head :bad_request
    end
  end

  def destroy
    @tag = Tag.find params[:id]
    @tag.destroy
    head :ok
  end
end
