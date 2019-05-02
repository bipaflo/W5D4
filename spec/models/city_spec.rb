require 'rails_helper'

RSpec.describe City, type: :model do

  before(:each) do 
    @city = City.create(id: 1, name: "Fourqueux", zip_code: "78112")
  end

  context "validations" do

    it "is valid with valid attributes" do
      expect(@city).to be_a(City)
      expect(@city).to be_valid
    end

    describe "#some_attribute" do
      it "should not be valid without zip_code" do
        bad_city = City.create(id: 1, name: "Fourqueux")
        expect(bad_city).not_to be_valid
        # test très sympa qui permet de vérifier que la fameuse formule user.errors retourne bien un hash qui contient une erreur concernant le first_name. 
        expect(bad_city.errors.include?(:zip_code)).to eq(true)
      end

      it "should not be valid without listing_id" do
        bad_city = City.create(id: 1, zip_code: "78112")
        expect(bad_city).not_to be_valid
        # test très sympa qui permet de vérifier que la fameuse formule user.errors retourne bien un hash qui contient une erreur concernant le first_name. 
        expect(bad_city.errors.include?(:name)).to eq(true)
      end
    end
  end
end