require 'rails_helper'

RSpec.describe "library_locations/new", type: :view do
  before(:each) do
    assign(:library_location, LibraryLocation.new(
      :city_name => "MyString",
      :latitude => "MyString",
      :longitude => "MyString",
      :user => nil
    ))
  end

  it "renders new library_location form" do
    render

    assert_select "form[action=?][method=?]", library_locations_path, "post" do

      assert_select "input#library_location_city_name[name=?]", "library_location[city_name]"

      assert_select "input#library_location_latitude[name=?]", "library_location[latitude]"

      assert_select "input#library_location_longitude[name=?]", "library_location[longitude]"

      assert_select "input#library_location_user_id[name=?]", "library_location[user_id]"
    end
  end
end
