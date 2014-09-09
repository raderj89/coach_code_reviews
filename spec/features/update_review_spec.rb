require 'rails_helper'

feature 'Update reviews', js: true do
  let!(:review) { create(:review, coach: "") }

  before do
    visit '/'
    within '.reviews' do
      expect(page).to have_css('div.bg-warning')
    end
  end

  scenario 'with valid coach name' do
    fill_in 'Coach', with: "Jared"

    click_button "Update"

    within '.reviews' do
      expect {
        find(:xpath, "//input[@id='edit_review_1]").value == "Jared"
      }
    end
  end

  scenario 'updating the status to active gives the review a blue background' do
    fill_in 'Coach', with: "Jared"
    check "Active"

    click_button "Update"

    within '.reviews' do
      expect(page).to have_css('div.bg-info')
    end
  end

  scenario 'updating the status to finished gives the review a green background' do
    fill_in 'Coach', with: "Jared"
    check "Finished"

    click_button "Update"

    within '.reviews' do
      expect(page).to have_css('div.bg-success')
    end
  end

  scenario 'with no coach name' do
    click_button "Update"

    expect {
      find(:xpath, "//input[@id='edit_review_1]").value == ""
    }

    expect(page).to have_css('div.bg-warning')
  end
end