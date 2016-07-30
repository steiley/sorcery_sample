require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  fixtures :users
  
  describe 'get index without login' do
    before { get :index }

    it 'should be success' do
      expect(response).to redirect_to root_path
    end

  end
  
  describe 'get index with login' do
    before do
      controller.current_user = users(:admin)
      
      get :index 
    end

    it 'should be success' do
      expect(response).to render_template(:index)
    end

    it 'should have all users' do
      expect(assigns[:users].try!(:count)).to eq User.all.count
    end
  end
  
  describe 'get new' do
    before do
      controller.current_user = users(:admin)
      
      get :new
    end
    
    it 'should be success' do
      expect(response).to render_template(:new)
    end
  end
  
  describe 'get new not admin' do
    before do
      controller.current_user = users(:user1)
      
      get :new
    end
    
    it 'should not be success' do
      expect(response).to redirect_to edit_user_path(controller.current_user)
    end
  end
  
  describe 'post create' do
    before do
      controller.current_user = users(:admin)
      
      @post_creeate = lambda{
        post :create, :user => {:email => 'test@test.com', :password => 'testtest',
        :password_confirmation => 'testtest'
        }
      } 
    end

    it 'should be redirect to index' do
      @post_creeate.call
      expect(response).to redirect_to users_path
     end

    it 'should increase one user' do
      expect{
        @post_creeate.call
      }.to change(User, :count).by(1)
    end
  end
  
  describe 'get edit as admin' do
    before do
      controller.current_user = users(:admin)
      
      get :edit, :id => (users(:user1)).id
    end
    
    it 'should be success' do
      expect(response).to render_template(:edit)
    end
  end
  
  describe 'get edit myself' do
    before do
      controller.current_user = users(:user1)
      
      get :edit, :id => (users(:user1)).id
    end
    
    it 'should be success' do
      expect(response).to render_template(:edit)
    end
  end  
  
  describe 'get edit other' do
    before do
      controller.current_user = users(:user1)
      
      get :edit, :id => (users(:user2)).id
    end
    
    it 'should be redirect' do
     expect(response).to redirect_to edit_user_path(controller.current_user)
    end
  end
  
  describe 'delete admin' do
    before do
      controller.current_user = users(:user1)
      
      delete :destroy, :id => (users(:admin)).id
    end
    
    it 'should be redirect' do
     expect(response).to redirect_to edit_user_path(controller.current_user)
    end
  end
  
  describe 'delete user' do
    before do
      controller.current_user = users(:admin)
      
      @delete_destroy = lambda{delete :destroy, :id => users(:user1).id}
    end
    
    it 'should be redirect to users/index' do
      @delete_destroy.call
      expect(response).to redirect_to users_path
    end
    
    it 'should be reduce one' do
      expect{
        @delete_destroy.call
      }.to change(User, :count).by(-1)
    end
  end
end
