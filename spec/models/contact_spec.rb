require 'rails_helper'

describe Contact do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Company.create(name: "ESPN")
        contact = company.contacts.create(position: "HR", email: "erikaannesmith@gmail.com")
        expect(contact).to be_invalid
      end
      it "is invalid without a position" do
        company = Company.create(name: "ESPN")
        contact = company.contacts.create(name: "Erika", email: "erikaannesmith@gmail.com")
        expect(contact).to be_invalid
      end
      it "is invalid without an email" do
        company = Company.create(name: "ESPN")
        contact = company.contacts.create(name: "Erika", position: "HR")
        expect(contact).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name and position and email" do
        company = Company.create(name: "ESPN")
        contact = company.contacts.create(name: "Erika", position: "HR", email: "erikaannesmith@gmail.com")
        expect(contact).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to companies" do
      company = Company.create(name: "ESPN")
      contact = company.contacts.create(name: "Erika", position: "HR", email: "erikaannesmith@gmail.com")
      expect(contact).to respond_to(:company)
    end
  end
end
