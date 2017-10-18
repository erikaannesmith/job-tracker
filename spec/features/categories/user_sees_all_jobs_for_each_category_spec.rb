require 'rails_helper'

describe "User sees all jobs for each category" do
  scenario "user will see all jobs for each category on show page" do
    category = Category.create!(title: "HR")
    company = Company.create!(name: "ESPN")
    company.jobs.create!(title: "HR person", description: "HR stuff", level_of_interest: 4, city: "LA", category: category)

    visit category_path(category)

    expect(page).to have_content("HR person")
  end
end
