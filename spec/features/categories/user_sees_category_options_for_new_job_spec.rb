require 'rails_helper'

describe "User sees category options for a new job" do
  scenario "user can see existing categories when creating a new job" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: "erika")

    visit new_company_job_path(company)

    expect(page).to have_content("Category")
    expect(page).to have_select(options: ["erika"])
    expect(page).to have_link("New Category")
  end
end
