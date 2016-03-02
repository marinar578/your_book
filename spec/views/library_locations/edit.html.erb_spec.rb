require 'rails_helper'

RSpec.describe "library_locations/edit", type: :view do
  before(:each) do
    @library_location = assign(:library_location, LibraryLocation.create!(
      :city_name => "MyString",
      :latitude => "MyString",
      :longitude => "MyString",
      :user => nil
    ))
  end

  it "renders the edit library_location form" do
    render

    assert_select "form[action=?][method=?]", library_location_path(@library_location), "post" do

      assert_select "input#library_location_city_name[name=?]", "library_location[city_name]"

      assert_select "input#library_location_latitude[name=?]", "library_location[latitude]"

      assert_select "input#library_location_longitude[name=?]", "library_location[longitude]"

      assert_select "input#library_location_user_id[name=?]", "library_location[user_id]"
    end
  end
end
