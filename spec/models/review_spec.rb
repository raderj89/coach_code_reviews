require 'rails_helper'

describe Review do
  it { should validate_presence_of(:pull_request_url) }
  it { should allow_value("Jared").for(:coach) }
  it { should_not allow_value("Jared" * 50).for(:coach) }

  describe "it validates presence of coach on update" do
    let(:review) { create(:review) }

    subject { review }

    it { should validate_presence_of(:coach) }
  end

  describe "reviews are ordered by date created" do
    let!(:older_review) { create(:review, created_at: 1.day.ago) }
    let!(:newer_review) { create(:review, created_at: 1.hour.ago) }

    it "orders the microposts in the right order" do
      expect(Review.all).to eq [newer_review, older_review]
    end
  end
end