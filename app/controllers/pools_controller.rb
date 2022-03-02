class PoolsController < ApplicationController

 def index
    @pools = Pool.all
 end

 def show
   @pool = Pool.find(params[:id])
 end

 def new
   @pool = Pool.new
 end

 def create
   @pool = Pool.new(pool_params)
   @pool.user = current_user
   if @pool.save
      redirect_to @pool, notice: "New pool added! :)"
   else
      render :new
   end
 end

 private

 def pool_params
   params.require(:pool).permit(:size, :address, :name, :price, :description)
 end

end
