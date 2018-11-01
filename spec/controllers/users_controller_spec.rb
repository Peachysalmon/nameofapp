require 'rails_helper'

describe UsersController, type: :controller do
  let(:user1) { User.create!(email: "test@gmx.de", password: "123456") }
  let(:user2) { User.create!(email: "test2@gmx.de", password: "654321") }

  describe 'GET #show' do
    context 'when a user is logged in' do

      before(:each) do
        sign_in user1
      end

      it 'loads correct user details' do
        get :show, params: { id: user1.id }
        expect(response).to be_ok
        expect(assigns(:user)).to eq user1
      end
    end

    context 'when a user is not logged in' do
      it 'redirects to login' do
        get :show, params: { id: user1.id }
        expect(response).to redirect_to(root_path)
      end
    end

    before (:each) do
      sign_in user2
    end

    context 'when user1 tries to access show page of user2' do
      it 'redirects to root_path' do
        get :show, params: { id: user1.id }
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
