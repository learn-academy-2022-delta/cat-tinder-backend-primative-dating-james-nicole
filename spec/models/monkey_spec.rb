require 'rails_helper'
#models_spec

RSpec.describe Monkey, type: :model do
    it "should validate name" do
        monkey = Monkey.create(age: 4, enjoys: 'banana splits', image: 'https://live.staticflickr.com/3946/15368916487_7063f08a82_b.jpg')

        expect(monkey.errors[:name]).to_not be_empty
    end

    it "should validate age" do
        monkey = Monkey.create(name: 'Bertha', enjoys: 'banana splits', image: 'https://live.staticflickr.com/3946/15368916487_7063f08a82_b.jpg')

        expect(monkey.errors[:age]).to_not be_empty
    end

    it "should validate enjoys" do
        monkey = Monkey.create(name: 'Bertha', age: 4, image: 'https://live.staticflickr.com/3946/15368916487_7063f08a82_b.jpg')

        expect(monkey.errors[:enjoys]).to_not be_empty
    end

    it "should validate enjoys to be at least 10 characters long" do
        monkey = Monkey.create(name: 'Bertha', age: 4, enjoys: 'dogs', image: 'https://live.staticflickr.com/3946/15368916487_7063f08a82_b.jpg')

        expect(monkey.errors[:enjoys].first).to eq("is too short (minimum is 10 characters)")
    end

    it "should validate image" do
        monkey = Monkey.create(name: 'Bertha', age: 4, enjoys: 'banana splits')

        expect(monkey.errors[:image]).to_not be_empty
    end    
end