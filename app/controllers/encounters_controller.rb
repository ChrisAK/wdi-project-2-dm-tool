class EncountersController < ProtectedController
  before_action :set_encounter, only: [:show]

  # GET /encounters
  def index
    #@encounters = Encounter.find(params[:campaign_id])
    @campaign_id = Campaign.find_by(:name => params[:campaign_id], :user_id => params[:user_id]).id
    # @campaign_id = @campaign.id

    @encounters = Encounter.where(:campaign_id => @campaign_id)

    render json: @encounters
  end

  # GET /encounters/1
  def show
    render json: @encounter
  end

  # POST /encounters
  def create

    @campaign_id = Campaign.find_by(:name => params[:campaign_id], :user_id => params[:user_id]).id

    @name = encounter_params[:name]

    @CR = encounter_params[:CR]
    @books = encounter_params[:books]
    @description = encounter_params[:description]

    @encounter = Encounter.new(:name => @name, :CR => @CR, :books => @books,
                               :description => @description, :campaign_id => @campaign_id)

    if @encounter.save
      render json: @encounter, status: :created, location: @encounter
    else
      render json: @encounter.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /encounters/1
  def update
    @campaign_id = Campaign.find_by(:name => params[:campaign_id],
                                    :user_id => params[:user_id]).id
    @encounter_id = Encounter.find_by(:name => params[:id],
                                      :campaign_id => @campaign_id).id
    @encounter = Encounter.where(:id => @encounter_id)

    if @encounter.update(encounter_params)
      render json: @encounter
    else
      render json: @encounter.errors, status: :unprocessable_entity
    end
  end

  # DELETE /encounters/1
  def destroy
    @campaign_id = Campaign.find_by(:name => params[:campaign_id],
                                    :user_id => params[:user_id]).id
    @encounter_id = Encounter.find_by(:name => params[:id],
                                      :campaign_id => @campaign_id).id
    @encounter = Encounter.find_by(:id => @encounter_id)

    @encounter.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_encounter
      @encounter = Encounter.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def encounter_params
      params.require(:encounter).permit(:name, :CR, :books, :description, :campaign_id).reject { |k, v| v.blank? }
    end
end
