module Home
  module Cell
    class Index < CannedHam::MyCell
      def footer_group
        State.all
      end
    end
  end
end
