require "application_system_test_case"

class AppliedJobsTest < ApplicationSystemTestCase
  setup do
    @applied_job = applied_jobs(:one)
  end

  test "visiting the index" do
    visit applied_jobs_url
    assert_selector "h1", text: "Applied Jobs"
  end

  test "creating a Applied job" do
    visit applied_jobs_url
    click_on "New Applied Job"

    fill_in "Application no", with: @applied_job.application_no
    check "Application status" if @applied_job.application_status
    fill_in "Company", with: @applied_job.company
    fill_in "Date applied", with: @applied_job.date_applied
    fill_in "Position", with: @applied_job.position
    check "Resume submit" if @applied_job.resume_submit
    click_on "Create Applied job"

    assert_text "Applied job was successfully created"
    click_on "Back"
  end

  test "updating a Applied job" do
    visit applied_jobs_url
    click_on "Edit", match: :first

    fill_in "Application no", with: @applied_job.application_no
    check "Application status" if @applied_job.application_status
    fill_in "Company", with: @applied_job.company
    fill_in "Date applied", with: @applied_job.date_applied
    fill_in "Position", with: @applied_job.position
    check "Resume submit" if @applied_job.resume_submit
    click_on "Update Applied job"

    assert_text "Applied job was successfully updated"
    click_on "Back"
  end

  test "destroying a Applied job" do
    visit applied_jobs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Applied job was successfully destroyed"
  end
end
