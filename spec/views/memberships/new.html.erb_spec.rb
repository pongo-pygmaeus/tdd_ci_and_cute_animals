require 'rails_helper'

RSpec.describe "memberships/new", type: :view do
  before(:each) do
    assign(:membership, Membership.new(
      :team_id => 1,
      :member_id => 1
    ))
  end

  it "renders new membership form" do
    render

    assert_select "form[action=?][method=?]", memberships_path, "post" do

      assert_select "input#membership_team_id[name=?]", "membership[team_id]"

      assert_select "input#membership_member_id[name=?]", "membership[member_id]"
    end
  end
end
