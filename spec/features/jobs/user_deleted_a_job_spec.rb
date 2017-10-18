require 'rails_helper'

describe "User deletes a job" do
  scenario "a user can delete an existing job" do

    company = Company.create!(name: "Target")
    company.jobs.create!(title: "Manager", description: "Manage things.", level_of_interest: 4, city: "Denver")
    company.jobs.create!(title: "Employee", description: "Employ things.", level_of_interest: 2, city: "Detroit")

    expect(company.jobs.count).to eq(2)

    visit company_jobs_path(company)

    click_link "Manager"
    click_link "Delete Job"

    expect(company.jobs.count).to eq(1)
  end
end
