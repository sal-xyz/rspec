require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.

Do not modify anything within the chef and desert classes

=end

describe Dessert do
  #Test double = stunt double
  let(:chef) { double("chef") }

  describe "#initialize" do
    it "sets a type" do 
      test_dessert = Dessert.new("cupcake", 3, :chef)
      expect(test_dessert.type).to eq("cupcake")
    end

    it "sets a quantity"

    it "starts ingredients as an empty array"

    it "raises an argument error when given a non-integer quantity"
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array"
  end

  describe "#mix!" do
    it "shuffles the ingredient array"
  end

  describe "#eat" do
    it "subtracts an amount from the quantity"

    it "raises an error if the amount is greater than the quantity"
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name"
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
  end
end
