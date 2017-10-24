class SeoLandingPagesController < ApplicationController
  def show
    seo_landing_page = SeoLandingPage.where(path: params[:path]).first
    render html: cell(Location::Cell::Show, seo_landing_page,
      layout: Pro::Cell::Layout)
  end
end


# class CommentsController < ApplicationController
# def show
#   comment = Comment.find(params[:id])

#   render html: cell(Comment::Cell::Show, comment,
#     context: { current_user: current_user },
#     layout:  Pro::Cell::Layout
#     )
# end
