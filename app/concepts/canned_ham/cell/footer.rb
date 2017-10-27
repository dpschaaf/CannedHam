class CannedHam::Cell
  class Footer < CannedHam::Cell
  def footer_group
    context[:footer_group] || State.all
  end
end
