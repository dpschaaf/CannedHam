class HomeController < ApplicationController
  def index
    render html: cell(Home::Cell::Index, nil,
      layout: CannedHam::Cell::Layout
      )
  end
  def privacy
    render html: cell(Home::Cell::Privacy, nil,
      layout: CannedHam::Cell::Layout
      )
  end
end
