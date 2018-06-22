class Wiki < ApplicationRecord
  has_many :collaborators
  has_many :userss, through: :collaborators

  scope :only_public, -> { where(is_private: false) }

  delegate :users, to: :collaborators

  def collaborators
    Collaborator.where(wiki_id: id)
  end

end
