module Location
  module Cell
    class Show < Trailblazer::Cell
      def readable_name
        "Aluminum"
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

      def place
        if model.city_id
          model.city.lat_long
        elsif model.county_id
          City.where(county_id: model.county_id).lat_long
        else
          county = County.where(state_id: model.state_id).first
          city = county.cities.sort_by(&:population).first
          city.lat_long
        end
      end
    end
  end
end
