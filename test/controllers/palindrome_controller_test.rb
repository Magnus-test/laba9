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

  test "should get count=6 with value=32" do
    get palindrome_view_url, params: {val: 32}
    assert_equal assigns[:count], 6
  end

  test "should get count=11 with value=250" do
    get palindrome_view_url, params: {val: 250}
    assert_equal assigns[:count], 11
  end

  test "should get count=0 with value<=0" do
    value = -10
    get palindrome_view_url, params: {val: value}
    assert_equal assigns[:count], 0
  end

  test "should get count=0 with string-value" do
    value = "text"
    get palindrome_view_url, params: {val: value}
    assert_equal assigns[:count], 0
  end

end
