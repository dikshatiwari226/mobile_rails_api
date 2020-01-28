 class Api::V1::RegistrationsController < Api::V1::ApiController
  # skip_before_action  :verify_authenticity_token 
  # skip_before_action :authenticate_user!, only: [:create, :resset_password]

  def create
    user = User.new(registration_params)
    if user.save
      return render json: {status: 200, data: {user: user}, :message =>"Successfully Signup"} 
    else
      warden.custom_failure!
      return render json: {status: 401, data: {user: nil, errors: user.errors.full_messages}}
    end
  end

  def index
    user = User.all
    if user.present?
      return render json: {status: 200, data: {user: user}, :message =>"All Users"} 
    else
      return render json: {status: 401, data: {user: nil, errors: user.errors}, :message =>" Rollback"} 
    end  
  end  

  def edit
  end

  def update
    user =  current_user
    if params[:user][:email].present?
      user.email = params[:user][:email]
    end 
    if params[:user][:password].present? 
      user.password = params[:user][:password] 
    end 
    if user.save
      return render json: {status: 200, data: {user: user}, :message =>"User Profile Successfully Updated"} 
    end
  end 

  def destroy
    user = User.find(params[:id])
    if user.destroy
      return render json: {status: 200, data: {user: user}, :message =>"User deleted successfully"} 
    end
  end
  
  def profile
    user = current_user
    render json: user
  end

  def current_user_update_image
    user = current_user
    user.update(image: params[:file])
    render json: { status: 200, data: {user: user}, :message =>"Image Updated Successfully"}
  end

  def edit_profile
    user = current_user
    user.update(registration_params)
    user.dob = params[:registration][:dob]
    if user.save!
      render json: { status: 200, data: {user: user}, :message =>"Profile updated Successfully"}
    else
      render json: { status: 401,  errors: user.errors.full_messages }
    end
  end

  private
  def registration_params
    params.require(:registration).permit(:name,:email, :password, :password_confirmation, :gender, :contact, :dob, :address, :profession, :image)
  end

end