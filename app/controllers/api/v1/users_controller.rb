class Api::V1::UsersController < Api::V1::BaseController
  
  def create
  end
  
  def show
  end
  
  def update
  end
  
  private
    def admin_params
      params.require(:admin).permit(
        :first_name, 
        :last_name, 
        :email 
      )
    end
        
end
