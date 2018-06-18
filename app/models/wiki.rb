class Wiki < ApplicationRecord
  belongs_to :user
  scope :only_public, -> { where(is_private: false) }
end
