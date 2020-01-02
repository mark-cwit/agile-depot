require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "check Check Payment Type" do
    visit store_index_url

    click_on "Add to Cart", match: :first

    click_on "Checkout"

    fill_in "order_name", with: 'Dave Thomas'
    fill_in "order_address", with: "123 Easy Street"
    fill_in "order_email", with: "dave@example.org"

    assert_no_selector "#order_routing_number"
    assert_no_selector "#order_account_number"

    select 'Check', from: 'Pay type'

    assert_selector "#order_routing_number"
    assert_selector "#order_account_number"

  end

  test "check CC Payment Type" do
    visit store_index_url

    click_on "Add to Cart", match: :first

    click_on "Checkout"

    fill_in "order_name", with: 'Dave Thomas'
    fill_in "order_address", with: "123 Easy Street"
    fill_in "order_email", with: "dave@example.org"

    assert_no_selector "#order_credit_card_number"
    assert_no_selector "#order_expiration_date"

    select 'Credit card', from: 'Pay type'

    assert_selector "#order_credit_card_number"
    assert_selector "#order_expiration_date"

  end



end
