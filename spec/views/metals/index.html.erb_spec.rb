require 'rails_helper'

RSpec.describe "metals/index", type: :view do
  before(:each) do
    assign(:metals, [
      Metal.create!(),
      Metal.create!()
    ])
  end

  it "renders a list of metals" do
    render
  end
end
