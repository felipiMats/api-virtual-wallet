require "test_helper"

class ExtractsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @extract = extracts(:one)
  end

  test "should get index" do
    get extracts_url, as: :json
    assert_response :success
  end

  test "should create extract" do
    assert_difference("Extract.count") do
      post extracts_url, params: { extract: { transaction_type: @extract.type, value: @extract.value, wallet_id: @extract.wallet_id } }, as: :json
    end

    assert_response :created
  end

  test "should show extract" do
    get extract_url(@extract), as: :json
    assert_response :success
  end

  test "should update extract" do
    patch extract_url(@extract), params: { extract: { transaction_type: @extract.type, value: @extract.value, wallet_id: @extract.wallet_id } }, as: :json
    assert_response :success
  end

  test "should destroy extract" do
    assert_difference("Extract.count", -1) do
      delete extract_url(@extract), as: :json
    end

    assert_response :no_content
  end
end
