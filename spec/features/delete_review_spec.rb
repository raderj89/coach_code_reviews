require 'rails_helper'

feature 'Delete reviews', js: true do
  let!(:review) { create(:review) }

  before do
    visit '/'

    expect(page).to have_content(review.pull_request_url)
  end

  scenario 'deleting a review' do
    within '.reviews' do
      click_link "Delete"
    end

    a = page.driver.browser.switch_to.alert
    a.accept

    within '.reviews' do
      expect(page).to_not have_content(review.pull_request_url)
    end
  end
end