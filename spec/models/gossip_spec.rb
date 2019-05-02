require 'rails_helper'

RSpec.describe Gossip, type: :model do
  before(:each) do 
    @city = City.create(id: 1, name: "Fourqueux", zip_code: "78112"),
    @user = User.create(id: 1, first_name: "Maxime", last_name: "Le Segretain", email: "mlesegret@gmail.com", age:"19", description: "j'aime les fruits en sirops", city_id: 1)
    @gossip = Gossip.create(id: 1, title: "Hello", content: "C'est moi", user_id: 1)
  end

  context "validations" do

    it "is valid with valid attributes" do
      expect(@gossip).to be_a(Gossip)
      expect(@gossip).to be_valid
    end

    describe "#content" do
      it "should not be valid without content" do
        bad_gossip = Gossip.create(id: 1, title: "Hello", user_id: 1)
        expect(bad_gossip).not_to be_valid
        # test très sympa qui permet de vérifier que la fameuse formule user.errors retourne bien un hash qui contient une erreur concernant le first_name. 
        expect(bad_gossip.errors.include?(:content)).to eq(true)
      end

      it "should not be valid without content" do
        bad_gossip = Gossip.create(id: 1, content: "C'est moi", user_id: 1)
        expect(bad_gossip).not_to be_valid
        # test très sympa qui permet de vérifier que la fameuse formule user.errors retourne bien un hash qui contient une erreur concernant le first_name. 
        expect(bad_gossip.errors.include?(:title)).to eq(true)
      end
    end
    
  end
end
