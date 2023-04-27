require "test_helper"

class BitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bite = bites(:one)
  end

  test "should get index" do
    get bites_url
    assert_response :success
  end

  test "should get new" do
    get new_bite_url
    assert_response :success
  end

  test "should create bite" do
    assert_difference("Bite.count") do
      post bites_url, params: { bite: { description: @bite.description, image: @bite.image, name: @bite.name, price: @bite.price } }
    end

    assert_redirected_to bite_url(Bite.last)
  end

  test "should show bite" do
    get bite_url(@bite)
    assert_response :success
  end

  test "should get edit" do
    get edit_bite_url(@bite)
    assert_response :success
  end

  test "should update bite" do
    patch bite_url(@bite), params: { bite: { description: @bite.description, image: @bite.image, name: @bite.name, price: @bite.price } }
    assert_redirected_to bite_url(@bite)
  end

  test "should destroy bite" do
    assert_difference("Bite.count", -1) do
      delete bite_url(@bite)
    end

    assert_redirected_to bites_url
  end
end
