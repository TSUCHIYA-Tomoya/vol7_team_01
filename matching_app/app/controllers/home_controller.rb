class HomeController < ApplicationController
  def top
  end

  def create
    @ints=params[:interest]
    redirect_to("/?&#{[@ints].to_query("jobs")}")

  end
end
