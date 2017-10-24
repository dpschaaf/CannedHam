module Location::Cell
  class Show < Trailblazer::Cell
    property :body

    def readable_name
      "Steve"
    end
  end
end
