require 'rails_helper'

RSpec.describe "metals/edit", type: :view do
  before(:each) do
    @metal = assign(:metal, Metal.create!())
  end

  it "renders the edit metal form" do
    render

    assert_select "form[action=?][method=?]", metal_path(@metal), "post" do
    end
  end
end
