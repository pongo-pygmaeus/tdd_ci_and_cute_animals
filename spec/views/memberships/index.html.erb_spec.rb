require 'rails_helper'

RSpec.describe "memberships/index", type: :view do
  before(:each) do

    @user   = User.create!(name: "User", age: 25)

    @league = League.create!(name: "Sport", 
                             day:  "Monday",
                             creator_id:  @user.id)

    @team   = Team.create!(name:  "Team",
                           uniform_color: "team",
                           captain_id: @user.id,
                           league_id:  @league.id)
    assign(:memberships, [
      Membership.create!(
        :team_id   => @team.id,
        :member_id => @user.id
      ),
      Membership.create!(
        :team_id   => @team.id,
        :member_id => @user.id
      )
    ])
  end

  it "renders a list of memberships" do
    render
    assert_select "tr>td", :text => @team.name.to_s, :count => 2
    assert_select "tr>td", :text => @user.name.to_s, :count => 2
  end
end
