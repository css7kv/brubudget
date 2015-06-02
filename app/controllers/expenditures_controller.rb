class ExpendituresController < ApplicationController
	def new
		@expenditure = Expenditure.new
		@expenditure.save
	end

	def create
		@expenditure = Expenditure.create(expenditure_params)

		if @expenditure.save
			redirect to @expenditure
		else
			render :new
		end
	end

	def index
		@expenditures = Expenditure.all
	end

private

	def expenditure_params
		params.require(:expenditure).permit(:item, :price, :image)
	end

end
