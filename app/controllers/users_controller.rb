class UsersController < ApplicationController
    before_action :set_user, only: %i[ show edit update destroy ]

    def show
        @user = current_user
        @stories = Story.where(user_id: @user.id)
    end

    def panel
        @users = User.all
    end

    def modify
        @user = User.find(params[:id])

        if @user.admin? 
            @user.update(admin: false)
        else
            @user.update(admin: true)
        end

        respond_to do |format|
            format.html { redirect_to admin_panel_path, notice: 'Status changed' }
        end
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
    end
end