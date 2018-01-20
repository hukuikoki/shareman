class ListingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing, only: [:update, :basics, :description, :address, :price, :photos, :calender, :bankaccount, :publish]
  def index
  end

  def show
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
       flash[:notice] = '変更しました'
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
  end

  def publish
  end

  private
    def listing_params
      params.require(:listing).permit(:home_type, :pet_type, :breeding_years, :pet_size, :price_pernight)
    end

    def set_listing
      @listing = Listing.find(params[:id])
    end
end
