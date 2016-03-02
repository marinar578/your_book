require 'rails_helper'

RSpec.describe "volumes/edit", type: :view do
  before(:each) do
    @volume = assign(:volume, Volume.create!(
      :title => "MyString",
      :author => "MyString",
      :page_count => 1,
      :published_date => 1,
      :user => nil
    ))
  end

  it "renders the edit volume form" do
    render

    assert_select "form[action=?][method=?]", volume_path(@volume), "post" do

      assert_select "input#volume_title[name=?]", "volume[title]"

      assert_select "input#volume_author[name=?]", "volume[author]"

      assert_select "input#volume_page_count[name=?]", "volume[page_count]"

      assert_select "input#volume_published_date[name=?]", "volume[published_date]"

      assert_select "input#volume_user_id[name=?]", "volume[user_id]"
    end
  end
end
