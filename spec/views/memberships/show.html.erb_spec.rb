require 'rails_helper'

RSpec.describe "memberships/show", type: :view do
  before(:each) do

    @user   = User.create!(name: "User", age: 25)

    @league = League.create!(name: "Sport", 
                             day:  "Monday",
                             creator_id:  @user.id)

    @team   = Team.create!(name:  "Team",
                           uniform_color: "team",
                           captain_id: @user.id,
                           league_id:  @league.id)

    @membership = assign(:membership, Membership.create!(
      :team_id => @team.id,
      :member_id => @user.id
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match("#{@team.name}")
    expect(rendered).to match("#{@user.name}")
  end
end
