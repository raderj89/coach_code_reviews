require 'rails_helper'

describe ReviewsController, js: true do
  let!(:review) { create(:review, coach: "") }

  describe 'GET #index' do
    it "renders the page" do
      get :index

      expect(response).to render_template(:index)
    end
  end

  describe 'POST #create' do
    context 'with valid pull request url' do

      it 'creates the review' do
        expect {
          post :create, review: attributes_for(:review), format: :js
        }.to change(Review, :count).by(1)
      end
    end
  end

  describe 'POST #create' do
    context 'with no pull request url' do

      it 'does not create the review' do
        expect {
          post :create, review: { pull_request_url: '' }, format: :js
        }.to_not change { Review.count }
      end
    end
  end

  describe 'PATCH #update' do
    context 'with coach' do

      it 'updates the review coach' do
        patch :update, id: review.id, review: attributes_for(:review, coach: "Jared"), format: :js
        
        expect(response).to be_success
      end
    end
  end

  describe 'PATCH #update' do
    context 'with no coach' do

      it 'does not update the review' do
        patch :update, id: review.id, review: attributes_for(:review, coach: ""), format: :js
        
        expect(review).to_not be_valid 
      end
    end
  end

  describe 'PATCH #update' do
    context 'with active status' do

      it 'updates the review active status' do
        patch :update, id: review.id, review: attributes_for(:review, coach: "Jared", active: true), format: :js
        
        expect(response).to be_success
      end
    end
  end

  describe 'PATCH #update' do
    context 'with finished status' do

      it 'updates the review finished status' do
        patch :update, id: review.id, review: attributes_for(:review, coach: "Jared", finished: true), format: :js
        
        expect(response).to be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the review' do
      expect {
        delete :destroy, id: review.id, format: :js
      }.to change(Review, :count).by(-1)
    end
  end

end