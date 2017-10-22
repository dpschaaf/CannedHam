require 'rails_helper'

RSpec.describe "metals/new", type: :view do
  before(:each) do
    assign(:metal, Metal.new())
  end

  it "renders new metal form" do
    render

    assert_select "form[action=?][method=?]", metals_path, "post" do
    end
  end
end
