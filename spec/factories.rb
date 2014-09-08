FactoryGirl.define do

  factory :review_without_coach, class: 'Review' do
    pull_request_url "https://github.com/fiddler-crabs-2014/sinatra-to-rails-pick-1-of-3-challenge/pull/2"
  end

  factory :review_with_coach do
    pull_request_url "https://github.com/fiddler-crabs-2014/sinatra-to-rails-pick-1-of-3-challenge/pull/2"
    coach "Jared"
  end

end