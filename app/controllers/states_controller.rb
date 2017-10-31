class StatesController < ApplicationController
  before_action :set_state, only: [:show]

  # GET /states/1
  # GET /states/1.json
  def show
    render html: cell(Location::Cell::Show, state, nil)
    render html: cell(Location::Cell::Show, seo_landing_page,
      layout: CannedHam::Cell::Layout,
      footer_group: footer_group)
  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_state
      @state = State.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def state_params
      params.fetch(:state, {})
    end
end
