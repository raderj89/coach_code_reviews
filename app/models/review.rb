class Review < ActiveRecord::Base

  validates :pull_request_url, presence: true
  validates :coach, presence: true, on: :update
  validates :active, inclusion: { in: [true, false] }
  validates :finished, inclusion: { in: [true, false] }
  validates_length_of :coach, maximum: 25

  default_scope { order('created_at DESC') }

  self.per_page = 20
end
