require 'rails_helper'

RSpec.describe "leagues/edit", type: :view do
  before(:each) do
    @user = User.create(name: "Max", age: 29)
    @league = assign(:league, League.create!(
      :name => "MyLeage",
      :creator_id => @user.id,
    ))
  end

  it "renders the edit league form" do
    render

    assert_select "form[action=?][method=?]", league_path(@league), "post" do

      assert_select "input#league_name[name=?]", "league[name]"

      assert_select "input#league_creator_id[name=?]", "league[creator_id]"
    end
  end
end
