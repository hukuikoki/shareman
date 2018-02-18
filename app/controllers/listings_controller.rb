class ListingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing, only: [:show, :update, :basics, :description, :address, :price, :photos, :calender, :bankaccount, :publish]
  before_action :accsess_deny, only: [:basics, :description, :address, :price, :photos, :calender, :bankaccount, :publish]

  def index
    @listings = current_user.listings
  end

  def show
    @photos = @listing.photos
  end

  def new
    @listing = current_user.listings.build
  end

  def create
    @listing = current_user.listings.build(listing_params)
    
    if @listing.save
      redirect_to manage_listing_basics_url(@listing), notice: "リスティングの作成・保存をしました"
    else
      redirect_to new_listing_url, notice: "リスティングの作成・保存出来ませんでした"
    end
  end

  def edit
  end

  def update
    if @listing.update(listing_params)
       redirect_back(fallback_location: root_url)
       flash[:notice] = '更新しました'
    end
  end

  def basics
  end

  def description
  end

  def address
  end

  def price
  end

  def photos
    @photo = Photo.new
  end

  def calender
  end

  def bankaccount
    @user = @listing.user
    session[:listing_id] = @listing.id
  end

  def publish
  end

  private
    def listing_params
      params.require(:listing).permit(:home_type, :pet_type, :breeding_years, :pet_size, :price_pernight, :address, :listing_title, :listing_content, :active)
    end

    def set_listing
      @listing = Listing.find(params[:id])
    end

    def accsess_deny
      if !(current_user == @listing.user)
        redirect_to root_url, notice: "他人の編集ページにはアクセスできません"
      end
    end
end
