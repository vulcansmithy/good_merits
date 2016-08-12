require "rails_helper"

describe Api::V1::UsersController do

  it "should do something" do
    
    first_name = Faker::Name.first_name 
    last_name  = Faker::Name.last_name
    email      = "#{first_name}.#{last_name}@example.com".downcase 
    payload = {
      user: {
        first_name: first_name,
        last_name:  last_name,
        email:      email
      }
    }
    
    post  "/api/users", payload
    
    expect(response.code).to eq "201"
    
    puts "@DEBUG #{__LINE__}    #{ap User.all}"
    
    user = User.first
    puts "@DEBUG #{__LINE__}    user.badges=#{ap user.badges}"
  end

end
