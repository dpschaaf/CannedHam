require 'rails_helper'

RSpec.describe "counties/show", type: :view do
  before(:each) do
    @county = assign(:county, County.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
