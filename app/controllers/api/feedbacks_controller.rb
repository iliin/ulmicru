class Api::FeedbacksController < Api::ApplicationController
  def create
    @feedback = FeedbackForm.new_with_model
    if @feedback.save params[:feedback]
      head :ok
    else
      head :bad_request
    end
  end
end
