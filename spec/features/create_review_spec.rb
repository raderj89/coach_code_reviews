require 'rails_helper'

feature 'Create reviews', js: true do
  let(:review) { create(:review_without_coach) }

  before do
    visit '/'
  end

  scenario 'with valid pull request url' do
    fill_in 'Pull Request URL', with: review.pull_request_url

    click_button "Request Review"

    wait_for_ajax

    within '.reviews' do
      expect(page).to have_content(review.pull_request_url)
    end
  end

  scenario 'with no pull request url' do
    click_button "Request Review"

    within '.reviews' do
      expect(page).to_not have_content(review.pull_request_url)
    end
  end
end