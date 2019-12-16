 class Api::V1::SessionsController < Api::V1::ApiController
  skip_before_action  :verify_authenticity_token

 	def create
    byebug
    email = params[:email]
    password = params[:password]
    @user_email = params[:email]
    @user_pass = params[:password]
    @user = User.where(email: email)
    if @user.present?
        # sign_in @user
        return render json: {status: 200, data: {user: @user}, message: "Login Successfully"}
    elsif @user_email.blank? && @user_pass.blank?
        return render json: {status: 401,  message: "The request must contain the email and password"}
    else
        return render json: {status: 401, message: "Invalid Username or Password"}
    end
  end


  def destroy
    email = params[:email]
  	user = User.find_by(email: email)
    user.destroy
    if user.destroy
      return render json: {status: 200, data: {user: user}, :message =>"Logout successfully"} 
    end
  end


  

 end