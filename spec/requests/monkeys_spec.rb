require 'rails_helper'

#requests.spec

RSpec.describe "Monkeys", type: :request do
	describe "GET /index" do
		it "gets a list of monkeys" do
			Monkey.create(
				name: "Felipe",
				age: 3,
				enjoys: "Sunshine and warm spots",
				image: "https://cdn.britannica.com/06/150806-050-6AE99C98/Proboscis-monkey.jpg?w=690&h=388&c=crop"
			)

			get '/monkeys'
			monkey = JSON.parse(response.body)
			expect(response).to have_http_status(200)
			expect(monkey.length).to eq 1
		end
	end

  	describe "POST/ create" do
		it "creates a monkey" do
			monkey_params = {
				monkey: {
					name: "Felipe",
					age: 3,
					enjoys: "Sunshine and warm spots",
					image: "https://cdn.britannica.com/06/150806-050-6AE99C98/Proboscis-monkey.jpg?w=690&h=388&c=crop"
				}	
			}

			post '/monkeys', params: monkey_params
			expect(response).to have_http_status(200)
			monkey = Monkey.first
			expect(monkey.name).to eq 'Felipe'
			expect(monkey.age).to eq 3
			expect(monkey.enjoys).to eq 'Sunshine and warm spots'
			expect(monkey.image).to eq "https://cdn.britannica.com/06/150806-050-6AE99C98/Proboscis-monkey.jpg?w=690&h=388&c=crop"
		end
	end

  	describe "PATCH/ update" do
		it "updates a monkey" do
			monkey_params = {
				monkey: {
					name: "Felipe",
					age: 3,
					enjoys: "Sunshine and warm spots",
					image: "https://cdn.britannica.com/06/150806-050-6AE99C98/Proboscis-monkey.jpg?w=690&h=388&c=crop"
				}
			}

			post '/monkeys', params: monkey_params
			monkey = Monkey.first
			updated_monkey_params = {
				monkey: {
					name: "Felipe",
					age: 4,
					enjoys: "Sunshine and warm spots",
					image: "https://cdn.britannica.com/06/150806-050-6AE99C98/Proboscis-monkey.jpg?w=690&h=388&c=crop"
				}
			}

			patch "/monkeys/#{monkey.id}", params: updated_monkey_params
			updated_monkey = Monkey.find(monkey.id)
			expect(response).to have_http_status(200)
			expect(updated_monkey.age).to eq 4
		end
	end

  	describe "DELETE /destroy" do
		it"deletes a monkey" do
			monkey_params = {
				monkey: {
					name: "Felipe",
					age: 3,
					enjoys: "Sunshine and warm spots",
					image: "https://cdn.britannica.com/06/150806-050-6AE99C98/Proboscis-monkey.jpg?w=690&h=388&c=crop"
		    	}
			}

			post "/monkeys", params: monkey_params
			monkey = Monkey.first
			delete"/monkeys/#{monkey.id}"
			expect(response).to have_http_status(200)
			monkeys = Monkey.all
			expect(monkeys).to be_empty
		end
	end

	describe "cannot create a monkey without valid attributes" do
    it "doesn't create a monkey without a name" do
            monkey_params = {
                monkey: {
                    age: 4,
                    enjoys: 'banana splits',
                    image: 'https://live.staticflickr.com/3946/15368916487_7063f08a82_b.jpg'
                }
            }

            post '/monkeys', params: monkey_params
            expect(response.status).to eq(422)
            monkey = JSON.parse(response.body)
            expect(monkey['name']).to include "can't be blank"
        end

    it "doesn't create a monkey without an age" do
            monkey_params = {
                monkey: {
                    name: 'Bertha',
                    enjoys: 'banana splits',
                    image: 'https://live.staticflickr.com/3946/15368916487_7063f08a82_b.jpg'
                }
            }

            post '/monkeys', params: monkey_params
            expect(response.status).to eq(422)
            monkey = JSON.parse(response.body)
            expect(monkey['age']).to include "can't be blank"
        end
	it "doesn't create a monkey without an enjoys" do
		monkey_params = {
			monkey: {
				name: 'Bertha',
                age: 4,
				image: 'https://live.staticflickr.com/3946/15368916487_7063f08a82_b.jpg'
			}
		}

			post '/monkeys', params: monkey_params
			expect(response.status).to eq(422)
			monkey = JSON.parse(response.body)
			expect(monkey['enjoys']).to include "can't be blank"
		end

	it "doesn't create a monkey without an image" do
		monkey_params = {
			monkey: {
				name: 'Bertha',
                age: 4,
                enjoys: 'banana splits'				
			}
		}

			post '/monkeys', params: monkey_params
			expect(response.status).to eq(422)
			monkey = JSON.parse(response.body)
			expect(monkey['image']).to include "can't be blank"
		end
	end
end
