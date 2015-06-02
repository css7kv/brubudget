class ExpendituresController < ApplicationController
	def new
		@expenditure = Expenditure.new
	end

	def create
		@expenditure = Expenditure.create(expenditure_params)

		if @expenditure.save
			redirect_to @expenditure
		else
			render :new
		end
	end

	def index
		@expenditures = Expenditure.all
	end

	def show
		@expenditure = Expenditure.find(params[:id])
	end

	def edit
		@expenditure = Expenditure.find(params[:id])
	end

	def update 
		@expenditure = Expenditure.create(expenditure_params)

		if @expenditure.save
			redirect_to @expenditure
		else
			render :edit
		end
	end

private

	def expenditure_params
		params.require(:expenditure).permit(:item, :price, :image)
	end

end
