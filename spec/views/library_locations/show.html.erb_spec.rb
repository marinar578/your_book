require 'rails_helper'

RSpec.describe "library_locations/show", type: :view do
  before(:each) do
    @library_location = assign(:library_location, LibraryLocation.create!(
      :city_name => "City Name",
      :latitude => "Latitude",
      :longitude => "Longitude",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/City Name/)
    expect(rendered).to match(/Latitude/)
    expect(rendered).to match(/Longitude/)
    expect(rendered).to match(//)
  end
end
