require 'rails_helper'

RSpec.describe "volumes/show", type: :view do
  before(:each) do
    @volume = assign(:volume, Volume.create!(
      :title => "Title",
      :author => "Author",
      :page_count => 1,
      :published_date => 2,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
