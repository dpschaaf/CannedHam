class CountyConstraint
  COUNTY_SUFFIX = "_county"
 
  def matches?(request)
    request.fullpath.include?(COUNTY_SUFFIX)
  end
end
