class Web::Admin::PositionsController < Web::Admin::ApplicationController
  def update
    @position_form = PositionForm.find_with_model params[:id]
    if @position_form.submit params[:position]
      redirect_to admin_unviewed_index_path anchor: :positions
    else
      redirect_to admin_unviewed_index_path anchor: :positions
    end
  end

  def destroy
    @position = Position.find params[:id]
    @position.remove
    redirect_to admin_unviewed_index_path anchor: :positions
  end
end
