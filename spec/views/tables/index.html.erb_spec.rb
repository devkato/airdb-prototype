require 'spec_helper'

describe "tables/index.html.erb" do
  before(:each) do
    assign(:tables, [
      stub_model(Table,
        :name => "Name",
        :project_id => 1,
        :user_id => 1
      ),
      stub_model(Table,
        :name => "Name",
        :project_id => 1,
        :user_id => 1
      )
    ])
  end

  it "renders a list of tables" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
