module ArticleScopes
  extend ActiveSupport::Concern
  include Concerns::StateMachine

  included do
    scope :removed, -> { where state: :removed }
    scope :presented, -> { where.not state: :removed}
  end
end