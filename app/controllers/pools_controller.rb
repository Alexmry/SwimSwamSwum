class PoolsController < ApplicationController

 def index
    @pools = Pool.all
 end

 def my_pools
    @pools = Pool.where(user_id: current_user.id)
 end

 def show
   @pool = Pool.find(params[:id])
   @booking = Booking.new
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

  def edit
    @pool = Pool.find(params[:id])
   #  raise
  end

  def update
    @pool = Pool.find(params[:id])
    @pool.update(pool_params)
    redirect_to @pool, notice: "Pool updated! :)"
  end

  def destroy
    @pool = Pool.find(params[:id])
    @pool.destroy
    redirect_to pools_path
  end

 private

 def pool_params
   params.require(:pool).permit(:size, :address, :name, :price, :description, :photo)
 end

end
