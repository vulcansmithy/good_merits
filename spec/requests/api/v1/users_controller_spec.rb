require "rails_helper"

describe Api::V1::UsersController do

  it "should do something" do
    
    10.times do
      
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
    end
    
    puts "@DEBUG #{__LINE__}    #{ap User.all}"
    

    users = User.all
    for i in 0..4 
      expect(users[i].badges.empty?).to eq false
    end  

    for i in 5..9 
      expect(users[i].badges.empty?).to eq true
    end  
  end

end
