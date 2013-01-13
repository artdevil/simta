require 'spec_helper'

describe "topics/new" do
  before(:each) do
    assign(:topic, stub_model(Topic,
      :user_id => 1,
      :title => "MyString",
      :description => "MyText",
      :abstract => "MyText",
      :status => "MyString"
    ).as_new_record)
  end

  it "renders new topic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => topics_path, :method => "post" do
      assert_select "input#topic_user_id", :name => "topic[user_id]"
      assert_select "input#topic_title", :name => "topic[title]"
      assert_select "textarea#topic_description", :name => "topic[description]"
      assert_select "textarea#topic_abstract", :name => "topic[abstract]"
      assert_select "input#topic_status", :name => "topic[status]"
    end
  end
end
