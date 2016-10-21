require 'rails_helper'

RSpec.describe "leagues/index", type: :view do
  before(:each) do
    @user = User.create(name: "Seba", age: 30)
    assign(:leagues, [
      League.create!(
        :name => "Name",
        :creator_id => @user.id
      ),
      League.create!(
        :name => "Name",
        :creator_id => @user.id
      )
    ])
  end

  it "renders a list of leagues" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => @user.name.to_s, :count => 2
  end
end
