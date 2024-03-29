require "test_helper"

class UsersTest < ActionDispatch::IntegrationTest
    test "guest user" do
        get links_path
        assert_select "a", "Sign Up"
        assert_select "a", "Login"
    end

    test "user can be logged in" do
        sign_in users(:one)
        get links_path
        assert_match "Profile", response.body
        assert_select "a", "Profile"
        assert_select "button", "Logout"
    end

    test "admin user can be logged in" do
        sign_in users(:admin)
        get links_path
        assert_match "Dashboard", response.body
        assert_select "button", "Logout"
    end
end