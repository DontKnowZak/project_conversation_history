class Project < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :name, :status, presence: true
end
