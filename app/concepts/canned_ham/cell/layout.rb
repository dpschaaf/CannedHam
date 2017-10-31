module CannedHam
  module Cell
    class Layout < Trailblazer::Cell
      include ActionView::Helpers::CsrfHelper
    end
  end
end
