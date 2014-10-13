class Admin:VideosController < Admin::BaseController
	before_action :set_video, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  def index
    @videos = Video.all
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
  end

  # GET /accounts/new
  def new
  	@video = Video.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @video = Video.new(video_params)

    respond_to do |format|
      if @video.save
        format.html { redirect_to [:admin, :videos], notice: 'video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to [:admin, :videos], notice: 'video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to [:admin, :videos], notice: 'video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:account_id, :video])
    end
end