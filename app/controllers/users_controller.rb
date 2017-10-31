class UsersController < ApplicationController
  def new
    @user = User.new
    binding.pry
    render html: cell(::User::Cell::New, @user,
      layout: CannedHam::Cell::Layout
      )
  end
end
