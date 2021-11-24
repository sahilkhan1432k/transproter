require "application_system_test_case"

class JobapplicationsTest < ApplicationSystemTestCase
  setup do
    @jobapplication = jobapplications(:one)
  end

  test "visiting the index" do
    visit jobapplications_url
    assert_selector "h1", text: "Jobapplications"
  end

  test "creating a Jobapplication" do
    visit jobapplications_url
    click_on "New Jobapplication"

    fill_in "Description", with: @jobapplication.description
    fill_in "Email", with: @jobapplication.email
    fill_in "Name", with: @jobapplication.name
    click_on "Create Jobapplication"

    assert_text "Jobapplication was successfully created"
    click_on "Back"
  end

  test "updating a Jobapplication" do
    visit jobapplications_url
    click_on "Edit", match: :first

    fill_in "Description", with: @jobapplication.description
    fill_in "Email", with: @jobapplication.email
    fill_in "Name", with: @jobapplication.name
    click_on "Update Jobapplication"

    assert_text "Jobapplication was successfully updated"
    click_on "Back"
  end

  test "destroying a Jobapplication" do
    visit jobapplications_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Jobapplication was successfully destroyed"
  end
end
