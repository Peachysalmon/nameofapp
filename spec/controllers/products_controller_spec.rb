require 'rails_helper'

describe ProductsController, type: :controller do

  before do
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.build(:user, admin: true)
    @product = FactoryBot.create(:product)
  end

  describe 'GET #index' do
    it "should get the index page of the products" do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    it "should get the single product page" do
      get :show, params: {id: @product}
      expect(response).to be_ok
      expect(response).to render_template('show')
    end
  end

# New Product Test

  describe 'GET #new' do
    before do
      sign_in@user
    end

    it "should not load a form for a new product" do
      get :new
      expect(response).not_to be_ok
      expect(response).to redirect_to(products_path)
    end
  end

# Edit Product Test

  describe 'GET #edit' do
    before do
      sign_in@user
    end

    it "should redirect to product index page" do
      get :edit, params: {id: @product}
      expect(response).not_to be_ok
      expect(response).to redirect_to(products_path)
    end
  end

#Create Product Test

  describe 'POST #create' do

    before do
      sign_in@user2
    end

    it "creates a new product" do
      @product = FactoryBot.create(:product)
      expect(response).to be_successful
    end

    it "cannot create new product" do
      expect(Product.new).to be_invalid
    end

    it "cannot create new product 'missing name'" do
      @product2 = FactoryBot.build(:product, name: "")
      expect(Product.new).to be_invalid
    end
  end

  #Update Product Test

  describe 'PATCH #update' do

    before do
      sign_in@user
      @product = FactoryBot.create(:product)
    end

    it "updates the product name" do
      patch :update, params: { id: @product.id, product: { :name => "new title", :description => "new description" }}
      expect(response).to be_redirect
    end
  end

#Delete Product Test

  describe 'DELETE #destroy' do

    before do
      sign_in@user
      @product = FactoryBot.create(:product)
    end

    it "removes the product from the database" do
      delete :destroy, params: { id: @product.id }
      expect(response).to redirect_to(products_path)
    end
  end


end
