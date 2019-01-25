require 'test_helper'

class SerifCollectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get serif_collections_index_url
    assert_response :success
  end

end
