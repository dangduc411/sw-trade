class Admin::AccountsController < Admin::BaseController
  before_action :set_account, only: [:show, :edit, :update, :destroy]
  before_filter :require_login

  # GET /accounts
  # GET /accounts.json
  def index
    if params[:tag]
      @accounts = Account.tagged_with(params[:tag])
    else
      @accounts = Account.all
    end
  end

  # GET /accounts/1
  # GET /accounts/1.json
  def show
    @account_photos = @account.photos.all
  end

  # GET /accounts/new
  def new
    @account = Account.new
    @acc_photo = @account.photos.build
    @video = @account.videos.build
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        set_default = 0
        params[:acc_photos]['photo'].each do |a|
          @acc_photo = @account.photos.create!(:photo => a, :account_id => @account.id)
          @acc_photo.save
        end
        format.html { redirect_to [:admin, :accounts], notice: 'Account was successfully created.' }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        if params[:acc_photos]
          params[:acc_photos]['photo'].each do |a|
            @acc_photo = @account.photos.create!(:photo => a, :account_id => @account.id)
          end
        end 
        format.html { redirect_to [:admin, :accounts], notice: 'Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    img_del = AccountPhoto.where("account_id = ?", @account.id)
    img_del.each do |d|
      d.destroy
      d.save
    end
    @account.destroy
    respond_to do |format|
      format.html { redirect_to [:admin, :accounts], notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def account_params
      params.require(:account).permit(:lv, :price, :description, :video, :selled, :user, :pass, :name, :tag_list ,photos_attributes:[:id, :account_id, :photo], videos_attributes:[:id, :video, :account_id])
    end
end
