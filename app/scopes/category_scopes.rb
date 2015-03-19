module CategoryScopes
  extend ActiveSupport::Concern
  include Concerns::StateMachine

  included do
    scope :roots, -> { where(parent_id: nil).where.not(state: :removed)}
    scope :last_childs, -> { where is_last: true }
    scope :removed, -> { where state: :removed}
  end
end
