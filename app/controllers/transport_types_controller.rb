class TransportTypesController < ApplicationController
  before_filter :authenticate_volunteer!

  def index
    respond_to do |format|
      format.json { render json: TransportType.all.to_json }
    end
  end


  private
  
  def transport_type_params
    params.require(:transport_type).permit(:name)
  end
end 
