 class Api::V1::SessionsController < Api::V1::ApiController
  skip_before_action  :verify_authenticity_token

  def create
    begin
      email = params[:email]
      password = params[:password]
      return render json: {status: 401, data: {user: nil}, errors: "The request must contain the email and password."} unless email.present? && password.present?
      @user = User.where(email: email).first
      return render json: {status: 401, data: {user: nil}, errors: "Must be exist email"} if @user.blank?
      return render json: {status: 401, data: {user: nil}, errors: "Invalid email or password"} if not @user.valid_password?(password)
      return render json: {status: 200, data: {user: current_user}, errors: "You have allready Login."} if current_user
      return render json: {status: 200, data: {user: @user}, message: "Login Successfully"}
    rescue
      rescue_section
    end
  end 

  def forgot 
    @user = User.where(email: params[:email]).first
    UserMailer.forgot(@user).deliver_now
    return render json: {status: 200, data: {user: @user}, message: "Please check your mail #{@user.email}"}
  end

  def destroy
    email = params[:email]
  	user = User.find_by(email: email)
    user.destroy
    if user.destroy
      return render json: {status: 200, data: {user: user}, :message =>"Logout successfully"} 
    end
  end

  private
  def rescue_section
    return render json: {status: 500, data: {review: nil}, message: "Something Went Wrong"}
  end 
  

 end