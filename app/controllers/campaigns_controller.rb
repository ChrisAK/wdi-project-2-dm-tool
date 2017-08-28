class CampaignsController < ProtectedController
  before_action :set_campaign, only: [:show, :destroy]

  # GET /campaigns
  def index
    @campaigns = Campaign.where(:user_id => params[:user_id])

    render json: @campaigns
  end

  # GET /campaigns/1
  def show
    render json: @campaign
  end

  # POST /campaigns
  def create
    @campaign = Campaign.new(campaign_params)

    if @campaign.save
      render json: @campaign, status: :created, location: @campaign
    else
      render json: @campaign.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /campaigns/1
  def update
    @campaign_id = Campaign.find_by(:name => params[:id],
                                 :user_id => params[:user_id]).id

    @campaign = Campaign.where(:id => @campaign_id)

    if @campaign.update(campaign_params)
      render json: @campaign
    else
      render json: @campaign.errors, status: :unprocessable_entity
    end
  end

  # DELETE /campaigns/1
  def destroy
    @campaign.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def campaign_params
      params.require(:campaign).permit(:name, :scheduled_day, :user_id).reject { |k, v| v.blank? }
    end
end
