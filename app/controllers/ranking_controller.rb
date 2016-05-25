class RankingController < ApplicationController
  before_action :set_item
  before_action :logged_in_user
  
  
  def have
    @have_array = Array.new()
    #have_array = @items.sort {|a, b| a[:item_id].want_users.count <=> a[:id].want_users.count }
    @items.each do |item|
      if item.have_users.count > 0
        @have_array.push([item ,item.have_users.count])
      end
    end
    @have_array.sort! { |a, b| b[1] <=> a[1] }
    if @have_array.size < 10
      @have_array = @have_array.first(@have_array.size)
    else
      @have_array = @have_array.first(10)
    end
      
  end

  def want
    @want_array = Array.new()
    @items.each do |item|
      if item.want_users.count > 0
        @want_array.push([item ,item.want_users.count])
      end
    end
    @want_array.sort! { |a, b| b[1] <=> a[1] }
    if @want_array.size < 10
      @want_array = @want_array.first(@want_array.size)
    else
      @want_array = @want_array.first(10)
    end
  end
  
  private
  def set_item
    @items = Item.all
  end
end
