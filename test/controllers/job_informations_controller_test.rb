require 'test_helper'

class JobInformationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_information = job_informations(:one)
  end

  test "should get index" do
    get job_informations_url
    assert_response :success
  end

  test "should get new" do
    get new_job_information_url
    assert_response :success
  end

  test "should create job_information" do
    assert_difference('JobInformation.count') do
      post job_informations_url, params: { job_information: { company_location: @job_information.company_location, company_name: @job_information.company_name, job_description: @job_information.job_description, job_title: @job_information.job_title, post_date: @job_information.post_date } }
    end

    assert_redirected_to job_information_url(JobInformation.last)
  end

  test "should show job_information" do
    get job_information_url(@job_information)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_information_url(@job_information)
    assert_response :success
  end

  test "should update job_information" do
    patch job_information_url(@job_information), params: { job_information: { company_location: @job_information.company_location, company_name: @job_information.company_name, job_description: @job_information.job_description, job_title: @job_information.job_title, post_date: @job_information.post_date } }
    assert_redirected_to job_information_url(@job_information)
  end

  test "should destroy job_information" do
    assert_difference('JobInformation.count', -1) do
      delete job_information_url(@job_information)
    end

    assert_redirected_to job_informations_url
  end
end
