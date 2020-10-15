require 'rails_helper'

RSpec.describe Person, type: :model do
  describe "creation" do
    before do 
      @person = Person.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", full_name: "sepid mir",
                              birth_date: Time.now, social_insurance_number:696969698 )
    end

    it "can create a person" do    
      expect(@person).to be_valid
    end

    it "cannot create a person without a full name" do
      @person.full_name = nil
      expect(@person).to_not be_valid
    end

    it "cannot create a person without a birth date" do
      @person.birth_date = nil
      expect(@person).to_not be_valid
    end

    it "cannot create a person without a social insurance number" do
      @person.social_insurance_number = nil
      expect(@person).to_not be_valid
    end

  end
end