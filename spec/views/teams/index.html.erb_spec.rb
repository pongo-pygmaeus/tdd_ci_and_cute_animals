require 'rails_helper'

RSpec.describe "teams/index", type: :view do
  before(:each) do

    @user   = User.create!(name: "User", age: 25)

    @league = League.create!(name: "Sport", 
                             day:  "Monday",
                             creator_id:  @user.id)

    assign(:teams, [
      Team.create!(
        :name => "Name",
        :uniform_color => "Color",
        :captain_id => @user.id,
        :league_id  => @league.id
      ),
      Team.create!(
        :name => "Name",
        :uniform_color => "Color",
        :captain_id => @user.id,
        :league_id => @league.id
      )
    ])
  end

  it "renders a list of teams" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Color".to_s, :count => 2
    assert_select "tr>td", :text => @user.name.to_s, :count => 2
  end
end
