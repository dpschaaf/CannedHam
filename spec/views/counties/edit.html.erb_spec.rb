require 'rails_helper'

RSpec.describe "counties/edit", type: :view do
  before(:each) do
    @county = assign(:county, County.create!())
  end

  it "renders the edit county form" do
    render

    assert_select "form[action=?][method=?]", county_path(@county), "post" do
    end
  end
end
