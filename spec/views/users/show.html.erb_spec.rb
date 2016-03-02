require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :fname => "Fname",
      :lname => "Lname",
      :email => "Email",
      :password_digest => "Password Digest",
      :image => "Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Fname/)
    expect(rendered).to match(/Lname/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Password Digest/)
    expect(rendered).to match(/Image/)
  end
end
