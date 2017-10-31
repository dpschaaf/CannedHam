module Home
  module Cell
    class Privacy < CannedHam::MyCell
      def footer_group
        State.all
      end
    end
  end
end
