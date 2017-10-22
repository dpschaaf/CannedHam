class StateConstraint
  COUNTY_SUFFIX = "_county"
 
  def matches?(request)
    State.all.map { |state| state.to_param }
  end
end
