require "application_system_test_case"

class JobInformationsTest < ApplicationSystemTestCase
  setup do
    @job_information = job_informations(:one)
  end

  test "visiting the index" do
    visit job_informations_url
    assert_selector "h1", text: "Job Informations"
  end

  test "creating a Job information" do
    visit job_informations_url
    click_on "New Job Information"

    fill_in "Company location", with: @job_information.company_location
    fill_in "Company name", with: @job_information.company_name
    fill_in "Job description", with: @job_information.job_description
    fill_in "Job title", with: @job_information.job_title
    fill_in "Post date", with: @job_information.post_date
    click_on "Create Job information"

    assert_text "Job information was successfully created"
    click_on "Back"
  end

  test "updating a Job information" do
    visit job_informations_url
    click_on "Edit", match: :first

    fill_in "Company location", with: @job_information.company_location
    fill_in "Company name", with: @job_information.company_name
    fill_in "Job description", with: @job_information.job_description
    fill_in "Job title", with: @job_information.job_title
    fill_in "Post date", with: @job_information.post_date
    click_on "Update Job information"

    assert_text "Job information was successfully updated"
    click_on "Back"
  end

  test "destroying a Job information" do
    visit job_informations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Job information was successfully destroyed"
  end
end
