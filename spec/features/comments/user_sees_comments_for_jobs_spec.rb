require 'rails_helper'

describe "User sees comments for jobs" do
  scenario "user can see comments for job on the show page" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "HR", description: "HR stuff", level_of_interest: 4, city: "LA")
    job.comments.create(author_name: "Erika", body: "Hi")

    visit company_job_path(company, job)

    expect(page).to have_content("Erika")
    expect(page).to have_content("Hi")
  end
  scenario "user can see a form to post a comment on the job show page" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "HR", description: "HR stuff", level_of_interest: 4, city: "LA")

    visit company_job_path(company, job)

    expect(page).to have_content("Post a Comment")
    expect(page).to have_field("comment[author_name]")
    expect(page).to have_field("comment[body]")
  end
  scenario "user is redirected to job page after posting comment" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "HR", description: "HR stuff", level_of_interest: 4, city: "LA")

    visit company_job_path(company, job)

    fill_in "comment[author_name]", with: "Erika"
    fill_in "comment[body]", with: "Hi"

    click_button "Submit"

    expect(current_path).to eq(company_job_path(company, job))
  end
end
