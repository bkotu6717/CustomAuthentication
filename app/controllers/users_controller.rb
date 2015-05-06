class UsersController < ApplicationController
	before_filter :verify_user_status, except: [:create, :new]

	def index
		@users = User.all
	end
	
  def new
  	@user = User.new
	end

	def create
	  @user = User.new(params[:user])
	  if @user.save
	  	session[:user_id] = @user.id
	    redirect_to action: :index, controller: 'users'
	  else
	    render "new"
	  end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(params[:user])
			redirect_to action: :index
		else
			render 'edit', notice: 'Unable to update user....!'
		end
	end

	def destroy
		@user = User.find(params[:id])
		if @user != current_user
			if @user.destroy
				redirect_to action: :index
			else
				redirect_to action: :index, notice: 'Problem deleting user..!'
			end
		else
			redirect_to action: :index, notice: 'Could not delete yourself.!'
		end
	end

	private
		def verify_user_status
			puts current_user.inspect
			if !current_user.nil?
				return true
			else
				redirect_to action: :new, controller: :sessions
			end
		end
end
