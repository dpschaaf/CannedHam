require 'rails_helper'

RSpec.describe "counties/index", type: :view do
  before(:each) do
    assign(:counties, [
      County.create!(),
      County.create!()
    ])
  end

  it "renders a list of counties" do
    render
  end
end
