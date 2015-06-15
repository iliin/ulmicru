module NewsScopes
  extend ActiveSupport::Concern
  include Concerns::StateMachine

  included do
    scope :published, -> {
      where('published_at <= ?', DateTime.now).
      where.not(state: :removed).
      order('published_at DESC')
    }
    scope :unpublished, -> {
      where('published_at > ?',  DateTime.now).
      where.not(state: :removed).
      order('published_at DESC')
    }
    scope :removed, -> { where state: :removed }
    scope :main, -> { where state: :main }
    scope :confirmed, -> { where state: :confirmed }
    scope :unviewed, -> { where state: :unviewed }
    scope :popular, -> {
      where('published_at <= ?', DateTime.now).
      order('views DESC')
    }
  end
end
