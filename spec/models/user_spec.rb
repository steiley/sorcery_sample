require 'rails_helper'

RSpec.describe User, :type => :model do
  fixtures :users, :hobbies
  
  it "is not valid without a email" do
    user = User.new(email: nil)
    expect(user).to_not be_valid
  end
  
  it "is not valid with a invalid email" do
    user = users(:user1).tap{|u|u.email = 'user@com.'}
    expect(user).to_not be_valid
  end
  
  it "is not valid with unmatched password" do
    user = users(:user1).tap do |u|
        u.password = 'password'
        u.password_confirmation = 'passward'
      end
    expect(user).to_not be_valid
  end

  it "is valid" do
    user = users(:user1).tap do |u|
        u.password = 'password'
        u.password_confirmation = 'password'
      end
    expect(user).to be_valid
  end
  
  it "is valid" do
    user = users(:user1).tap do |u|
        u.hobby_ids = [hobbies(:sports), hobbies(:reading_books)].map(&:id)
        u.email = 'user3@user3.com'
      end
    expect(user.save).to be true
    expect(user.hobbies.count).to be 2
  end
end
