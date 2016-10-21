require 'rails_helper'

RSpec.describe "teams/show", type: :view do
  before(:each) do

    @user   = User.create!(name: "User", age: 25)

    @league = League.create!(name: "Sport", 
                             day:  "Monday",
                             creator_id:  @user.id)

    @team = assign(:team, Team.create!(
      :name => "Name",
      :uniform_color => "Uniform Color",
      :captain_id => @user.id,
      :league_id => @league.id
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Uniform Color/)
    expect(rendered).to match("#{@user.id}")
  end
end
