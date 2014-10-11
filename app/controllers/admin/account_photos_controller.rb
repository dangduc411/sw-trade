class Admin::AccountPhotosController < Admin::BaseController
  before_action :set_acc_photo, only: [:show, :edit, :update, :destroy]

  # GET /acc_photos
  # GET /acc_photos.json
  def index
    @acc_photos = AccPhoto.all
  end

  # GET /acc_photos/1
  # GET /acc_photos/1.json
  def show
  end

  # GET /acc_photos/new
  def new
    @acc_photo = AccountPhoto.new
  end

  # GET /acc_photos/1/edit
  def edit
  end

  # POST /acc_photos
  # POST /acc_photos.json
  def create
    @acc_photo = AccountPhoto.new(acc_photo_params)

    respond_to do |format|
      if @acc_photo.save
        format.html { redirect_to [:admin, :acc_photos], notice: 'Acc photo was successfully created.' }
        format.json { render :show, status: :created, location: @acc_photo }
      else
        format.html { render :new }
        format.json { render json: @acc_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /acc_photos/1
  # PATCH/PUT /acc_photos/1.json
  def update
    respond_to do |format|
      if @acc_photo.update(acc_photo_params)
        format.html { redirect_to [:admin, :acc_photos], notice: 'Acc photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @acc_photo }
      else
        format.html { render :edit }
        format.json { render json: @acc_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acc_photos/1
  # DELETE /acc_photos/1.json
  def destroy
    puts "==========="
    @acc_photo.destroy
    respond_to do |format|
      format.html { redirect_to (:back), notice: 'Acc photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acc_photo
      @acc_photo = AccountPhoto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def acc_photo_params
      params.require(:acc_photo).permit(:account_id, :photo, :default)
    end
end
