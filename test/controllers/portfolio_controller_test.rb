require 'test_helper'

class PortfolioControllerTest < ActionDispatch::IntegrationTest
  test "should get portrait_people" do
    get portfolio_portrait_people_url
    assert_response :success
  end

  test "should get portrait_pets" do
    get portfolio_portrait_pets_url
    assert_response :success
  end

  test "should get fine_art" do
    get portfolio_fine_art_url
    assert_response :success
  end

end
