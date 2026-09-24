require "test_helper"

class ContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contact = contacts(:one)
  end

  test "should get index" do
    get contacts_url, as: :json
    assert_response :success
  end

  test "should create contact" do
    assert_difference("Contact.count") do
      post contacts_url, params: { contact: { name: @contact.name, phno: @contact.phno, is_favourite: true } }, as: :json
    end

    assert_response :created
    assert_equal true, JSON.parse(response.body)["is_favourite"]
  end

  test "should show contact" do
    get contact_url(@contact), as: :json
    assert_response :success
  end

  test "should update contact" do
    patch contact_url(@contact), params: { contact: { name: @contact.name, phno: @contact.phno, is_favourite: true } }, as: :json
    assert_response :success
    assert_equal true, JSON.parse(response.body)["is_favourite"]
  end

  test "should destroy contact" do
    assert_difference("Contact.count", -1) do
      delete contact_url(@contact), as: :json
    end

    assert_response :no_content
  end
end
