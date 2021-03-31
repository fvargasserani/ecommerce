class VariantsController < ApplicationController

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_variant
      @variant = Variant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def variant_params
      params.require(:variant).permit(:size, :color, :stock, :product_id, :_destroy)
    end
end
