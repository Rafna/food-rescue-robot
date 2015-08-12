class CellCarrier < ActiveRecord::Base

  private
  
  def cell_carrier_params
    params.require(:cell_carrier).permit(:format, :name)
  end
end
