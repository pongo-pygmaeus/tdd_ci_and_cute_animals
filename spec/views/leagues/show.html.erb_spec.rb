require 'rails_helper'

RSpec.describe "leagues/show", type: :view do
  before(:each) do
    @user   = User.create!(name: "Name", age: 25)
    @league = assign(:league, League.create!(
      :name => "Name",
      :creator_id => @user.id
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match("#{@user.name}")
  end
end
