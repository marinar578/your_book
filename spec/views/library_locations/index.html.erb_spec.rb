require 'rails_helper'

RSpec.describe "library_locations/index", type: :view do
  before(:each) do
    assign(:library_locations, [
      LibraryLocation.create!(
        :city_name => "City Name",
        :latitude => "Latitude",
        :longitude => "Longitude",
        :user => nil
      ),
      LibraryLocation.create!(
        :city_name => "City Name",
        :latitude => "Latitude",
        :longitude => "Longitude",
        :user => nil
      )
    ])
  end

  it "renders a list of library_locations" do
    render
    assert_select "tr>td", :text => "City Name".to_s, :count => 2
    assert_select "tr>td", :text => "Latitude".to_s, :count => 2
    assert_select "tr>td", :text => "Longitude".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
