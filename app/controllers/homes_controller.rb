class HomesController < ApplicationController
  def top
    flash[:notice] = "Signed out successfully."
  end
end
