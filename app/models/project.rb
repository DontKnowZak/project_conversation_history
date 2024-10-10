class Project < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :status_changes, dependent: :destroy

  validates :name, :status, presence: true

  after_create :create_initial_status_change

  private

  def create_initial_status_change
    StatusChange.create!(status: self.status, user: User.first, project: self)
  end
end
