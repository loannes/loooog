class ImageAssetsController < ApplicationController
  before_action :set_image_asset, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!

  respond_to :html

  def index
    @image_assets = ImageAsset.all

    render layout: 'post'
  end

  def show
    render layout: 'post'
  end

  def new
    @image_asset = ImageAsset.new

    render layout: 'post'
  end

  def edit
    render layout: 'post'
  end

  def create
    @image_asset = ImageAsset.new(image_asset_params)
    @image_asset.save
    respond_with(@image_asset)
  end

  def update
    @image_asset.update(image_asset_params)
    respond_with(@image_asset)
  end

  def destroy
    @image_asset.destroy
    respond_with(@image_asset)
  end

  private
    def set_image_asset
      @image_asset = ImageAsset.find(params[:id])
    end

    def image_asset_params
      params.require(:image_asset).permit(:slug, :lg, :md, :sm, :xs)
    end
end
