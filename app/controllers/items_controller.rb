class ItemsController < ApplicationController
  before_action :logged_in_user , except: [:show]
  before_action :set_item, only: [:show]

  def new
    if params[:q]
      response = RakutenWebService::Ichiba::Item.search(
        keyword: params[:q],
        imageFlag: 1,
      )
      @items = response.first(20)
    end
  end

  def show
    page_title = @item.title
    base_title = "monolist"
    if page_title.empty?
      base_title
    else
      "#{page_title} - #{base_title}"
    end
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
end
