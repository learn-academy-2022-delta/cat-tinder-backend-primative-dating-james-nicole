require 'rails_helper'

RSpec.describe "Monkeys", type: :request do
	describe "GET /index" do
		it "gets a list of monkeys" do
			Monkey.create(
        name: "Felipe",
        age: 3,
        enjoys: "sunshine and warm spots",
        image: "https://cdn.britannica.com/06/150806-050-6AE99C98/Proboscis-monkey.jpg?w=690&h=388&c=crop"
			)
			get '/monkeys'
			monkey = JSON.parse(response.body)
			expect(response).to have_http_status(200)
			expect(monkey.length).to eq 1
		end
	end
end
