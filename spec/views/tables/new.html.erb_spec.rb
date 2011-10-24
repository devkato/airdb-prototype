require 'spec_helper'

describe "tables/new.html.erb" do
  before(:each) do
    assign(:table, stub_model(Table,
      :name => "MyString",
      :project_id => 1,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new table form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tables_path, :method => "post" do
      assert_select "input#table_name", :name => "table[name]"
      assert_select "input#table_project_id", :name => "table[project_id]"
      assert_select "input#table_user_id", :name => "table[user_id]"
    end
  end
end
