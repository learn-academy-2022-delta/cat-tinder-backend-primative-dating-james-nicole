class MonkeysController < ApplicationController
	def index	
        monkeys = Monkey.all
		render json: monkeys
	end

	def create
		monkey = Monkey.create(monkey_params)
		render json: monkey
	end
	
	def update
		monkey = Monkey.find(params[:id])
		monkey.update(monkey_params)
		render json: monkey
	end

	def destroy
		monkey = Monkey.find(params[:id])
		monkey.destroy
		render json: monkey
	end
	
	private
	def monkey_params
		params.require(:monkey).permit(:name, :age, :enjoys, :image)
	end
end
