require 'rails_helper'

RSpec.describe "budgets/show", type: :view do
  before(:each) do
    @budget = assign(:budget, Budget.create!(
      name: "Name",
      amount: 2,
      user: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
  end
end
