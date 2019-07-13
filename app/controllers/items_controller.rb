class ItemsController < ApplicationController
  def show
    # Itemモデルの    :idの番号をデータ
    @item = Item.find(params[:id])
  
  end
  def index 
    @items = Item.all
  end

  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to @item # item/4
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to @item
  end
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end


  private

  def item_params
    params.require(:item).permit(:name, :price, :seller, :description, :email, :image_url)
  end

end
