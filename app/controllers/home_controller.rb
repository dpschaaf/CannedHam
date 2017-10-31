class HomeController < ApplicationController
  def index
    render html: cell(Home::Cell::Index, nil)
  end

  def privacy
    render html: cell(Home::Cell::Privacy, nil)
  end
end
