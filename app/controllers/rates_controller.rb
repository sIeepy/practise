class RatesController < ApplicationController

  def create
    rate = current_user.rates.build(rate_params)
    if rate.save
      redirect_to movie_path(params[:movie_id]), notice: 'Rate was succesfully created'
    else
      redirect_to movie_path(params[:movie_id]), alert: 'Rate was not created'
    end
  end

  def destroy
    rate = Rate.find(params[:id])
    if current_user.id == rate.user_id
      rate.destroy
      redirect_to movie_path(params[:movie_id]), notice: 'Rate was destroy'
    else
      redirect_to movie_path(params[:movie_id]), alert: 'Rate was not destroy'
    end
  end

  private

  def rate_params
    params.require(:rate).permit(:rating, :movie_id, :user_id)
  end
end
