module Home::Cell
  class Index < CannedHam::Cell
    def footer_group
      State.all
    end
  end
end
