require 'rails_helper'

RSpec.describe "volumes/index", type: :view do
  before(:each) do
    assign(:volumes, [
      Volume.create!(
        :title => "Title",
        :author => "Author",
        :page_count => 1,
        :published_date => 2,
        :user => nil
      ),
      Volume.create!(
        :title => "Title",
        :author => "Author",
        :page_count => 1,
        :published_date => 2,
        :user => nil
      )
    ])
  end

  it "renders a list of volumes" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
