class News < ActiveRecord::Base
  before_save :set_initial_state
  has_many :tags, as: :record
  has_and_belongs_to_many :attachments, class_name: 'Document'

  mount_uploader :photo,    PhotoUploader
  validates :title,         presence: true
  validates :body,          presence: true
  validates :published_at,  presence: true
  validates :photo,         presence: true
  validates :user_id,       presence: true
  validates :lead,          presence: true
  validates :state,         presence: true
  belongs_to :user

  def is_published?
    published_at <= DateTime.now && state != 'removed'
  end

  include NewsScopes

  state_machine :state, initial: :unviewed do
    state :unviewed
    state :confirmed
    state :removed

    event :confirm do
      transition all => :confirmed
    end
    event :remove do
      transition all => :removed
    end
    event :restore do
      transition :removed => :unviewed
    end
  end

  private
  def set_initial_state
    state = "unviewed" unless state.present?
  end
end
