class Api::Users::Account::AttributeAccessesController < Api::Users::ApplicationController
  def create
    @access = AttributeAccess.where(member_attribute: params[:attribute_access][:member_attribute], member_id: params[:attribute_access][:member_id]).first || AttributeAccess.new
    @access_form = AttributeAccessForm.new @access
    if @access_form.submit params[:attribute_access]
      head :ok
    else
      head :bad_request
    end
  end
end
