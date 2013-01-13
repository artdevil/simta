require 'spec_helper'

describe "topics/show" do
  before(:each) do
    @topic = assign(:topic, stub_model(Topic,
      :user_id => 1,
      :title => "Title",
      :description => "MyText",
      :abstract => "MyText",
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/Status/)
  end
end
