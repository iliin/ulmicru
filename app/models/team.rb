class Team < ActiveRecord::Base
  belongs_to :member
  has_many :tags, as: :target,
                  dependent: :destroy
  has_and_belongs_to_many :members

  validates :title, presence: true

  include TeamScopes

  state_machine :state, initial: :unviewed do
    state :unviewed
    state :active
    state :removed

    event :confirm do
      transition all => :active
    end
    event :remove do
      transition all => :removed
    end
    event :restore do
      transition all => :unviewed
    end
  end
  #FIXME tags association
  include Concerns::TagsHelper

  def is_departament?
    model_name == 'Team::Departament'
  end

  def is_administration?
    model_name == 'Team::Administration'
  end

  def is_subdivision?
    model_name == 'Team::Subdivision'
  end
end
