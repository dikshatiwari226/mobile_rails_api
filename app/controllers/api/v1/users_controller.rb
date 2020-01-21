class Api::V1::UsersController < Api::V1::ApiController

	def create
    user = User.new(user_params)
      user.save
        render json: user
  end

	def index
    user = User.all
    if user.present?
      return render json: {status: 200, data: {user: user}, :message =>"All Users"} 
    else
      return render json: {status: 401, data: {user: nil, errors: user.errors}, :message =>" Rollback"} 
    end  
  end 

	def show
		user = User.find(params[:id])
		render json: user
	end

	def edit
		render json: user
	end

	def update
		user = User.find(params[:id])
		if user.update(name: params[:name],email: params[:email],gender: params[:gender],contact: params[:contact],dob: params[:dob],address: params[:address],profession: params[:profession], image: params[:file])
      return render json: {status: 200, data: {user: user}, :message =>"User Successfully Updated"} 
    else
       return render json: { status: 401,  errors: user.errors.full_messages }
    end
	end

	def destroy
    user = User.find(params[:id])
    if user.destroy
      return render json: {status: 200, data: {user: user}, :message =>"User deleted successfully"}
    else
      return render json: { status: 401,  errors: user.errors.full_messages }
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:email, :password, :gender, :contact, :dob, :address, :profession, :image)
  end

end 
