require 'rails_helper'

RSpec.describe User, type: :model do
    
  before(:each) do 
    @city = City.create(id: 1, name: "Fourqueux", zip_code: "78112"),
    @user = User.create(id: 1, first_name: "Maxime", last_name: "Le Segretain", email: "mlesegret@gmail.com", age:"19", description: "j'aime les fruits en sirops", city_id: 1)
  end

  context "validations" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
      expect(@user).to be_valid
    end

    describe "#email" do
      it "should not be valid without email" do
        bad_user = User.create(first_name: "Maxime", last_name: "Le Segretain", description: "j'aime les fruits en sirops", age:"19", city_id: 1)
        expect(bad_user).not_to be_valid
        # test très sympa qui permet de vérifier que la fameuse formule user.errors retourne bien un hash qui contient une erreur concernant le first_name. 
        expect(bad_user.errors.include?(:email)).to eq(true)
      end
    end

    describe "#phone_number" do
      it "should not be valid without first_name" do
        bad_user = User.create(last_name: "Le Segretain", email: "mlesegret@gmail.com", description: "j'aime les fruits en sirops", age:"19", city_id: 1)
        expect(bad_user).not_to be_valid
        # test très sympa qui permet de vérifier que la fameuse formule user.errors retourne bien un hash qui contient une erreur concernant le first_name. 
        expect(bad_user.errors.include?(:first_name)).to eq(true)
      end
    end

    describe "#description" do
    it "should not be valid without description" do
      bad_user = User.create(first_name: "Maxime", last_name: "Le Segretain", email: "mlesegret@gmail.com", age:"19", city_id: 1)
      expect(bad_user).not_to be_valid
      # test très sympa qui permet de vérifier que la fameuse formule user.errors retourne bien un hash qui contient une erreur concernant le first_name. 
      expect(bad_user.errors.include?(:description)).to eq(true)
    end
  end

  end

  context "associations" do

    describe "something" do

    end

  end

  context "callbacks" do

    describe "some callbacks" do
      # teste ce callback
    end

  end

  context "public instance methods" do

    describe "#full_info" do
      it "should return a string" do
        expect(@user.full_name).to be_a(String)
      end
      it "should return a specific sentence" do
        expect(@user.full_name).to eq("Maxime Le Segretain")
      end
    end

  end

  context "public class methods" do

    describe "self.some_method" do
      # teste cette méthode
    end

  end


end