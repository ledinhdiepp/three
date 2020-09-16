#require_dependency "gns_banners/application_controller"

module GnsBanners::Backend
  class CatabannersController <  GnsBanners::Backend::BackendController
    before_action :set_catabanner, only: [:show, :edit, :update, :destroy]

    # GET /catabanners
    def index
     
    end
    
    def list
      @catabanners = Catabanner.search(params).paginate(:page => params[:page], :per_page => params[:per_page])
      
      render layout: nil
    end
    # GET /catabanners/1
    def show
      authorize! :read, @catabanner
    end

    # GET /catabanners/new
    def new
      @catabanner = Catabanner.new
    end

    # GET /catabanners/1/edit
    def edit
    end

    # POST /catabanners
    def create
      @catabanner = Catabanner.new(catabanner_params)

      if @catabanner.save
        redirect_to backend_catabanners_url, notice: 'Catabanner was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /catabanners/1
    def update
      if @catabanner.update(catabanner_params)
        redirect_to @catabanner, notice: 'Catabanner was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /catabanners/1
    def destroy
      @catabanner.destroy
      redirect_to backend_catabanners_url, notice: 'Catabanner was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_catabanner
        @catabanner = Catabanner.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def catabanner_params
        params.fetch(:catabanner, {}).permit(:name, :width, :height, :position, :thumb_resize)
      end
  end
end
