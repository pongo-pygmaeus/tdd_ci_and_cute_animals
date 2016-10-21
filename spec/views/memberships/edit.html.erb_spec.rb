require 'rails_helper'

RSpec.describe "memberships/edit", type: :view do

  before(:each) do
    @user   = User.create!(name: "Ken", age: 25)

    @league = League.create!(name: "Football", 
                            day:  "Friday",
                            creator_id:  @user.id)

    @team = Team.create!(name:  "Team",
                        uniform_color: "team",
                        captain_id: @user.id,
                        league_id:  @league.id)

    @membership = assign(:membership, Membership.create!(
      :team_id => @team.id,
      :member_id => @user.id
    ))
  end

  it "renders the edit membership form" do
    render

    assert_select "form[action=?][method=?]", membership_path(@membership), "post" do

      assert_select "input#membership_team_id[name=?]", "membership[team_id]"

      assert_select "input#membership_member_id[name=?]", "membership[member_id]"
    end
  end
end
