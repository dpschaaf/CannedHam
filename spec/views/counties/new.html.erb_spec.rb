require 'rails_helper'

RSpec.describe "counties/new", type: :view do
  before(:each) do
    assign(:county, County.new())
  end

  it "renders new county form" do
    render

    assert_select "form[action=?][method=?]", counties_path, "post" do
    end
  end
end
