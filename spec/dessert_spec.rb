require 'rspec'
require 'dessert'
require 'chef'

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

    it "sets a quantity" do 
      test_dessert = Dessert.new("cupcake", 3, :chef)
      expect(test_dessert.quantity).to eq(3)
    end

    it "starts ingredients as an empty array" do 
      test_dessert = Dessert.new("cupcake", 3, :chef)
      expect(test_dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do 
      expect { Dessert.new("cupcake", "a", :chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      test_dessert = Dessert.new("cupcake", 3, :chef)
      test_dessert.add_ingredient("molasses")
      expect(test_dessert.ingredients.include?("molasses")).to eq(true)
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      test_dessert = Dessert.new("cupcake", 3, :chef)
      test_dessert.add_ingredient("molasses")
      test_dessert.add_ingredient("sugar")
      test_dessert.add_ingredient("cinnamon")
      test_dessert.add_ingredient("milk")
      test_dessert.add_ingredient("eggs")

      before_shuffle = []
      test_dessert.ingredients.each { |ele| before_shuffle << ele}
      test_dessert.mix!
      after_shuffle = test_dessert.ingredients

      expect(before_shuffle == after_shuffle).to eq(false)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      test_dessert = Dessert.new("cupcake", 3, :chef)
      test_dessert.eat(1)
      expect(test_dessert.quantity).to eq(2)
    end

    it "raises an error if the amount is greater than the quantity" do
      test_dessert = Dessert.new("cupcake", 3, :chef)
      expect { test_dessert.eat(4) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      new_chef = Chef.new("Gordon")
      test_dessert = Dessert.new("cupcake", 3, new_chef)
      title_string = test_dessert.serve
      expect(title_string.include?(new_chef.titleize)).to eq(true)
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      new_chef = Chef.new("Gordon")
      test_dessert = Dessert.new("cupcake", 3, new_chef)
      test_dessert.make_more
      expect(test_dessert.temp).to eq(400)
    end
  end
end
