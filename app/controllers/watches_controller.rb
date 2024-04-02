class WatchesController < ApplicationController
  before_action :set_watch, only: %i[ show edit update destroy ]

  # GET /watches or /watches.json
  def index
    @watches = if params[:search].present?
      Watch.search(params[:search], params[:search_by]).page(params[:page]).per(12)
    else
      Watch.page(params[:page]).per(12)
    end
  end

  # GET /watches/1 or /watches/1.json
  def show
  end

  # GET /watches/new
  def new
    @watch = Watch.new
  end

  # GET /watches/1/edit
  def edit
  end

  # POST /watches or /watches.json
  def create
    @watch = Watch.new(watch_params)

    respond_to do |format|
      if @watch.save
        format.html { redirect_to watch_url(@watch), notice: "Watch was successfully created." }
        format.json { render :show, status: :created, location: @watch }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @watch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /watches/1 or /watches/1.json
  def update
    respond_to do |format|
      if @watch.update(watch_params)
        format.html { redirect_to watch_url(@watch), notice: "Watch was successfully updated." }
        format.json { render :show, status: :ok, location: @watch }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @watch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /watches/1 or /watches/1.json
  def destroy
    @watch.destroy!

    respond_to do |format|
      format.html { redirect_to watches_url, notice: "Watch was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_watch
      @watch = Watch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def watch_params
      params.require(:watch).permit(:model_id, :brand_id, :case_material_id, :strap_material_id, :crystal_material_id, :dial_color_id, :movement_type_id, :water_resistance, :case_diameter, :case_thickness, :band_width, :current_price)
    end
end
