class Review < ActiveRecord::Base

  validates :pull_request_url, presence: true
  validates :coach, presence: true, on: :update

  default_scope { order('created_at DESC') }

  self.per_page = 20
end
