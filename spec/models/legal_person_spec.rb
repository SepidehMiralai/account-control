require 'rails_helper'

RSpec.describe LegalPerson, type: :model do
  describe "creation" do
    before do 
      @legal_person = LegalPerson.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", company_name: "pandam",
                              fantasy_name: "panda", federal_business_number:696969698 )
    end

    it "can create a legal person" do    
      expect(@legal_person).to be_valid
    end

    it "cannot create a legal person without a company name" do
      @legal_person.company_name = nil
      expect(@legal_person).to_not be_valid
    end

    it "cannot create a legal person without a birth date" do
      @legal_person.fantasy_name = nil
      expect(@legal_person).to_not be_valid
    end

    it "cannot create a legal person without a social insurance number" do
      @legal_person.federal_business_number = nil
      expect(@legal_person).to_not be_valid
    end

  end
end