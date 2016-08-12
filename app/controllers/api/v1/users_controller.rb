class Api::V1::UsersController < Api::V1::BaseController
  
  # POST  /api/users
  # POST  /api/users, {}, { "Accept" => "application/vnd.sandbox.com; version=1" }
  # POST  /api/users?version=1
  # POST  /api/v1/users
  def create
    
    @user = User.new(user_params)
puts "@DEBUG #{__LINE__}    @user=#{ap @user}"    
    if @user.save
      success_response(@user, :created)
    else  
      error_response("Ecounter an issue saving the new User.", :bad_request)   
    end   
  end
  
  # GET   /api/users/:id
  # GET   /api/users/:id, {}, { "Accept" => "application/vnd.sandbox.com; version=1" }
  # GET   /api/users/:id?version=1
  # GET   /api/v1/users/:id
  def show
  end
  
  # PATCH /api/users/:id
  # PATCH /api/users/:id, {}, { "Accept" => "application/vnd.sandbox.com; version=1" }
  # PATCH /api/users/:id?version=1
  # PATCH /api/v1/users/:id
  def update
  end
  
  def current_user
puts "@DEBUG #{__LINE__}    @user=#{ap @user}"    
    @user
  end  
  
  private
    def user_params
      params.require(:user).permit(
        :first_name, 
        :last_name, 
        :email 
      )
    end
        
end
