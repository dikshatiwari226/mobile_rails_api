 class Api::V1::SessionsController < Api::V1::ApiController
  skip_before_action  :verify_authenticity_token

 	def create
 	 	email = params[:email]
  	password = params[:password]
	 	@user = User.where(email: email).first
    return render json: {status: 200, data: {user: @user}, message: "Login Successfully"}
  end


  def destroy
  	user = User.find(params[:id])
    user.destroy
    if user.destroy
      return render json: {status: 200, data: {user: user}, :message =>"Logout successfully"} 
    end
  end

 end