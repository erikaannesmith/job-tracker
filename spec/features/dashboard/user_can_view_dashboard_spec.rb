require 'rails_helper'

describe "User can view dashboard" do
  scenario "user sees a count of jobs by interest level" do
    company = Company.create(name: "ESPN")
    job = company.jobs.create(title: "HR", description: "HR stuff", level_of_interest: 4, city: "Detroit")

    visit dashboard_index_path

    expect(page).to have_content("Count of Jobs by Level of Interest")
    expect(page).to have_content("Detroit: 1")
  end
  scenario "user sees a count of jobs by location on dashboard" do
    company = Company.create(name: "ESPN")
    job = company.jobs.create(title: "HR", description: "HR stuff", level_of_interest: 4, city: "Detroit")

    visit dashboard_index_path

    expect(page).to have_content("0-10: 1")
  end
  scenario "user can access jobs by city from dashboard list" do
    company = Company.create(name: "ESPN")
    job = company.jobs.create(title: "HR", description: "HR stuff", level_of_interest: 4, city: "Detroit")

    visit dashboard_index_path

    click_link "Detroit"

    expect(page).to have_content("All Jobs in Detroit")
    expect(page).to have_content("HR: HR stuff")
  end
  scenario "user can see list of top three companies by average interest level" do
    company = Company.create(name: "Company1")
    job = company.jobs.create(title: "HR", description: "HR stuff", level_of_interest: 10, city: "Detroit")
    company = Company.create(name: "Company2")
    job = company.jobs.create(title: "HR", description: "HR stuff", level_of_interest: 1, city: "Detroit")
    company = Company.create(name: "Company3")
    job = company.jobs.create(title: "HR", description: "HR stuff", level_of_interest: 9, city: "Detroit")
    company = Company.create(name: "Company4")
    job = company.jobs.create(title: "HR", description: "HR stuff", level_of_interest: 8, city: "Detroit")

    visit dashboard_index_path

    expect(page).to have_content("Company1")
    expect(page).to have_content("Company3")
    expect(page).to have_content("Company4")
  end
end
