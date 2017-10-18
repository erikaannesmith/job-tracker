require 'rails_helper'

describe "User sees form for company contacts" do
  scenario "user can see a form to add company contacts from the company show page" do
    company = Company.create!(name: "ESPN")
    visit company_path(company)

    expect(page).to have_content("Contacts:")
    expect(page).to have_field("contact[name]")
    expect(page).to have_field("contact[position]")
    expect(page).to have_field("contact[email]")
  end
  scenario "user is redirected back to company show page when contact is submitted" do
    company = Company.create!(name: "ESPN")
    visit company_path(company)

    fill_in "contact[name]", with: "Erika"
    fill_in "contact[position]", with: "HR"
    fill_in "contact[email]", with: "erikaannesmith@gmail.com"

    click_button "Create Contact"

    expect(current_path).to eq(company_jobs_path(company))
    expect(page).to have_content("Erika")
    expect(page).to have_content("HR")
    expect(page).to have_content("erikaannesmith@gmail.com")

  end
end
