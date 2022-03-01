class PoolsController < ApplicationController

 def index
    @pools = Pool.all
 end


end
