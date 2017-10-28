module CannedHam
  module Cell
    class Footer < MyCell
      def footer_group
        context[:footer_group] || State.all
      end
    end
  end
end
