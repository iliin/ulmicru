class Web::Users::JoinController < Web::Users::ApplicationController
  before_filter :current_user_can_send_questionary

  def new
    questionary = current_user.becomes! Questionary
    @questionary_form = QuestionaryForm.new questionary
  end

  def create
    questionary = current_user.becomes! Questionary
    @questionary_form = QuestionaryForm.new questionary
    @questionary_form.submit params[:questionary]
    User.find(questionary.id).update type: 'Questionary'
    if @questionary_form.save
      redirect_to account_path
    else
      # FIXME fix this shiiiiit!!!!
      ActiveRecord::Base.connection.execute "UPDATE users SET type = NULL WHERE id = #{questionary.id}"
      render action: :new
    end
  end

  private

  def current_user_can_send_questionary
    redirect_to account_path unless current_user.is_user?
  end
end
