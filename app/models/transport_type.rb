class TransportType < ActiveRecord::Base
  default_scope { where(active:true) }

  private
  
  def transport_type_params
    params.require(:transport_type).permit(:name)
  end
end
