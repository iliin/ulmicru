class Api::Users::Account::AuthenticationsController < Api::ApplicationController
  def update
    @authentication_form = AuthenticationForm.find_with_model params[:id]
    if @authentication.save params[:authentication]
      head :ok
    else
      head :bad_request
    end
  end
end
