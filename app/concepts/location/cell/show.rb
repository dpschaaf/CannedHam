module Location::Cell
  class Show < CannedHam::Cell
    def readable_name
      "Steve"
    end

    def footer_group
      if model.city_id
        State.all
      elsif model.county_id
        City.where(county_id: model.county_id)
      else
        County.where(state_id: model.state_id)
      end
    end
  end
end
