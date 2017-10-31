module CannedHam
  module Cell
    class Footer < Trailblazer::Cell
      def footer_group
        options[:footer_group] || State.all
      end
    end
  end
end
