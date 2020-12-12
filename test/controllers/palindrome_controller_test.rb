require 'test_helper'

class PalindromeControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get palindrome_input_url
    assert_response :success
  end

  test "should get view" do
    get palindrome_view_url
    assert_response :success
  end

  test "should get size=6 with value=32" do
    get palindrome_view_url, params: {val: 32}
    assert_equal assigns[:result].size, 6
  end

  test "should get error with value<=0" do
    value = -10
    get palindrome_view_url, params: {val: value}
    assert_equal assigns[:result], 'Error. Input is negavite number or 0.'
  end

  test "should get error with string-value" do
    value = "text"
    get palindrome_view_url, params: {val: value}
    assert_equal assigns[:result], 'Error. Input is not a number.'
  end
end
