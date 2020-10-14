require 'test_helper'

class AccountTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account_transaction = account_transactions(:one)
  end

  test "should get index" do
    get account_transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_account_transaction_url
    assert_response :success
  end

  test "should create account_transaction" do
    assert_difference('AccountTransaction.count') do
      post account_transactions_url, params: { account_transaction: { account_id: @account_transaction.account_id, amount: @account_transaction.amount, transaction_number: @account_transaction.transaction_number, transaction_type: @account_transaction.transaction_type } }
    end

    assert_redirected_to account_transaction_url(AccountTransaction.last)
  end

  test "should show account_transaction" do
    get account_transaction_url(@account_transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_account_transaction_url(@account_transaction)
    assert_response :success
  end

  test "should update account_transaction" do
    patch account_transaction_url(@account_transaction), params: { account_transaction: { account_id: @account_transaction.account_id, amount: @account_transaction.amount, transaction_number: @account_transaction.transaction_number, transaction_type: @account_transaction.transaction_type } }
    assert_redirected_to account_transaction_url(@account_transaction)
  end

  test "should destroy account_transaction" do
    assert_difference('AccountTransaction.count', -1) do
      delete account_transaction_url(@account_transaction)
    end

    assert_redirected_to account_transactions_url
  end
end
