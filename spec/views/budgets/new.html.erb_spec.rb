require 'rails_helper'

RSpec.describe "budgets/new", type: :view do
  before(:each) do
    assign(:budget, Budget.new(
      name: "MyString",
      amount: 1,
      user: nil
    ))
  end

  it "renders new budget form" do
    render

    assert_select "form[action=?][method=?]", budgets_path, "post" do

      assert_select "input[name=?]", "budget[name]"

      assert_select "input[name=?]", "budget[amount]"

      assert_select "input[name=?]", "budget[user_id]"
    end
  end
end
