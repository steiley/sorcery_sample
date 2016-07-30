require 'rails_helper'

RSpec.describe AccountController, :type => :controller do
  fixtures :users
  describe 'get new' do
    before do    
      get :new
    end
    
    it 'should be success' do
      expect(response).to render_template(:new)
    end
  end
  
  describe 'post login' do
    before do    
      post :create, :email => 'admin@hoge.com', :password => 'password'
    end
    
    it 'should be success' do
      expect(response).to redirect_to users_path
    end
  end
  
  describe 'post login' do
    before do    
      post :create, :email => 'admin@hoge.com', :password => 'passward'
    end
    
    it 'should be fail' do
      expect(response).to render_template(:new)
    end
  end
  
  describe 'post logout' do
    before do    
      controller.current_user = users(:user1)
      delete :destroy
    end
    
    it 'should be success' do
      expect(controller.current_user).to be_nil
    end
    
    it 'should redirect' do
      expect(response).to redirect_to root_path
    end
  end

end
