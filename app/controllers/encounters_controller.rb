class EncountersController < ProtectedController
  before_action :set_encounter, only: [:show, :update, :destroy]

  # GET /encounters
  def index
    #@encounters = Encounter.find(params[:campaign_id])
    binding.pry
    @campaign_id = Campaign.find_by(:name => params[:campaign_id]).id
    # @campaign_id = @campaign.id
    binding.pry

    @encounters = Encounter.where(:campaign_id => @campaign_id)
    binding.pry

    render json: @encounters
  end

  # GET /encounters/1
  def show
    render json: @encounter
  end

  # POST /encounters
  def create
    @encounter = Encounter.new(encounter_params)

    if @encounter.save
      render json: @encounter, status: :created, location: @encounter
    else
      render json: @encounter.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /encounters/1
  def update
    if @encounter.update(encounter_params)
      render json: @encounter
    else
      render json: @encounter.errors, status: :unprocessable_entity
    end
  end

  # DELETE /encounters/1
  def destroy
    @encounter.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_encounter
      @encounter = Encounter.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def encounter_params
      params.require(:encounter).permit(:name, :CR, :books, :description, :campaign_id)
    end
end
