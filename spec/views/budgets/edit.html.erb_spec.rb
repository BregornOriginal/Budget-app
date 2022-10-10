require 'rails_helper'

RSpec.describe "budgets/edit", type: :view do
  before(:each) do
    @budget = assign(:budget, Budget.create!(
      name: "MyString",
      amount: 1,
      user: nil
    ))
  end

  it "renders the edit budget form" do
    render

    assert_select "form[action=?][method=?]", budget_path(@budget), "post" do

      assert_select "input[name=?]", "budget[name]"

      assert_select "input[name=?]", "budget[amount]"

      assert_select "input[name=?]", "budget[user_id]"
    end
  end
end
