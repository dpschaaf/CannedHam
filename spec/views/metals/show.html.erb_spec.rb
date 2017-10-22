require 'rails_helper'

RSpec.describe "metals/show", type: :view do
  before(:each) do
    @metal = assign(:metal, Metal.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
