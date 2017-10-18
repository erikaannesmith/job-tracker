require 'rails_helper'

describe "User updates a job" do
  scenario "a user can update a job" do
    company = Company.create!(name: "ESPN")
    company.jobs.create!(title: "HR", description: "Whatever HR does", level_of_interest: -2, city: "Houston")
    visit company_jobs_path(company)

    click_link "HR"
    click_link "Edit Job"

    fill_in "job[title]", with: "HR++"

    click_button "Update Job"

    expect(page).to have_content "HR++"
  end
end
