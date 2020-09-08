class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :authorized?, except: :create
    before_action :find_user, except: %i[create index]
    
    def index
        @users = User.all 
        render json: UserSerializer.new(@users).serialized_json
    end

    def create
        # @user = User.new(user_params)
        # if @user.valid?
        #     user = @user
        #     token = JWT.encode({user_id: user.id}, secret, 'HS256')
        #     render json: {user: UserSerializer.new(@user).serialized_json, token: token}
        # else
        #     render json: {errors: user.errors.full_messages}
        # end
        @user = User.new(user_params)
        if(@user.save)
            token = tokenForAccount(@user)
            render json: {user: UserSerializer.new(@user).serializable_hash, token: token}
        else
            render json: {errors: @user.errors.full_messages}
        end
    end

    def show 
        @user = User.find(params[:id])
        render json: @user
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        render json: @user
    end

    def destroy 
        @user = User.find(params[:id])
        @user.destroy
    end

    private

    def user_params
        params.permit(:user_name, :password)
    end

    def secret
        ENV["JWT_SECRET_KEY"]
    end

end
