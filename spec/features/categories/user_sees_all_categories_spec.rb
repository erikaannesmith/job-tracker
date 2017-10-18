require 'rails_helper'

describe "User can see all categories" do
  scenario "user is able to see all the categories in the index" do
    Category.create!(title: "123")
    Category.create!(title: "erika")

    visit categories_path

    expect(page).to have_content("123")
    expect(page).to have_content("erika")
    expect(page).to have_link("Delete")
    expect(page).to have_link("Edit")
    expect(page).to have_link("New Category")
  end
end
