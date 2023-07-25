class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :ensure_owner, only: [:edit, :update]
  before_action :ensure_logged_in, only: [:edit, :update]

  def index
    @item = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item), notice: "商品情報を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :items_name, :item_text, :category_id, :condition_id, :load_id, :prefecture_id, :delivery_id, :price).merge(user_id: current_user.id)
  end
  
def ensure_owner
  @item = Item.find(params[:id])
  redirect_to root_path, alert: "他のユーザーの商品は編集できません。" unless @item.user == current_user
end

def ensure_logged_in
  redirect_to login_path, alert: "ログインが必要です。" unless user_signed_in?
end
end











