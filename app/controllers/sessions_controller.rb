class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    user = user.try(:authenticate, params[:user][:password])
    return redirect_to(controller: 'sessions', action: 'new') unless user
    return head(:forbidden) unless @user.authentication(params[:password])
    session[user_id] = @user.id
  end


end
