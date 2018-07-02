class UsersController < ApplicationController
  def index
  	@users = Users.all.order(created_at: :desc)
  end
  def edit
		@users = Users.all.order(created_at: :desc)
  end
end
