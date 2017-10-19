require 'rails_helper'

describe Comment do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Company.create(name: "ESPN")
        job = company.jobs.create(title: "HR", description: "123", level_of_interest: 2, city: "LA")
        comment = job.comments.create(body: "2143")
        expect(comment).to be_invalid
      end

      it "is invalid without a body" do
        company = Company.create(name: "ESPN")
        job = company.jobs.create(title: "HR", description: "123", level_of_interest: 2, city: "LA")
        comment = job.comments.create(author_name: "Erika")
        expect(comment).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name and body" do
        company = Company.create(name: "ESPN")
        job = company.jobs.create(title: "HR", description: "123", level_of_interest: 2, city: "LA")
        comment = job.comments.create(author_name: "Eri", body: "hi")
        expect(comment).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to jobs" do
      company = Company.create(name: "ESPN")
      job = company.jobs.create(title: "HR", description: "123", level_of_interest: 2, city: "LA")
      comment = job.comments.create(author_name: "Eri", body: "hi")
      expect(comment).to respond_to(:job)
    end
  end
end
