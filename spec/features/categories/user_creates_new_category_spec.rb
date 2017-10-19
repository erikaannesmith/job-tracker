require 'rails_helper'

describe "User creates a new category" do
  scenario "a user can visit new category page" do
    visit categories_path

    click_link "New Category"

    expect(current_path).to eq(new_category_path)
  end
  scenario "a user can create a new category" do
    visit categories_path

    click_link "New Category"

    fill_in "category[title]", with: "erika"

    click_button "Create Category"

    expect(page).to have_content("erika added!")
  end
  scenario "a user cannot create two categories with same name" do
    Category.create!(title: "123")

    visit categories_path

    click_link "New Category"

    fill_in "category[title]", with: "123"

    click_button "Create Category"

    expect(page).to have_content("123 is already a category!")
    expect(page).to have_content("New Category")
  end
end
