class RankingController < ApplicationController
  before_action :set_item
  before_action :logged_in_user
  
  
  def have
    @have_array = Array.new()
    #have_array = @items.sort {|a, b| a[:item_id].want_users.count <=> a[:id].want_users.count }
    @items.each do |item|
      @have_array.push([item ,item.have_users.count])
    end
    @have_array.sort! { |a, b| b[1] <=> a[1] }
  end

  def want
    @want_array = Array.new()
    @items.each do |item|
      @want_array.push([item ,item.want_users.count])
    end
    @want_array.sort! { |a, b| b[1] <=> a[1] }
  end
  
  private
  def set_item
    @items = Item.all
  end
end