require 'rails_helper'

RSpec.describe "teams/edit", type: :view do
  before(:each) do

    @user   = User.create!(name: "User", age: 25)

    @league = League.create!(name: "Sport", 
                             day:  "Monday",
                             creator_id:  @user.id)

    @team = assign(:team, Team.create!(
      :name => "MyString",
      :uniform_color => "MyString",
      :captain_id => @user.id,
      :league_id =>  @league.id
    ))
  end

  it "renders the edit team form" do
    render

    assert_select "form[action=?][method=?]", team_path(@team), "post" do

      assert_select "input#team_name[name=?]", "team[name]"

      assert_select "input#team_uniform_color[name=?]", "team[uniform_color]"

      assert_select "input#team_captain_id[name=?]", "team[captain_id]"
    end
  end
end
