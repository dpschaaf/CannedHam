class CountiesController < ApplicationController
  before_action :set_county, only: [:show]

  # GET /counties/1
  # GET /counties/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_county
      @county = County.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def county_params
      params.fetch(:county, {})
    end
end
