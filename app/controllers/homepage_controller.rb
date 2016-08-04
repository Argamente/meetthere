require 'date'

class HomepageController < ApplicationController

  def index

    wday_array = ['周日','周一','周二','周三','周四','周五','周六']

   # @rand_number = rand(100000)

    @date_array = Array.new
    future_day = 12

    now = DateTime.now
    date_str = now.strftime("%Y.%m.%d");
    date_str += ' ' + wday_array[now.wday]
    @date_array.push(date_str)

    for i in 2..future_day
      tomorrow = now.tomorrow
      date_str = tomorrow.strftime("%Y.%m.%d")
      date_str += ' ' + wday_array[tomorrow.wday]
      @date_array.push(date_str)
      now = tomorrow
    end


    now_timestamp = DateTime.now.to_i

    # 数据查询
   # @stories = Story.all(:conditions=>["story_timestamp > :now_timestamp"])

    @stories = Story.where("story_timestamp > ?",now_timestamp).order('created_at DESC')
  end


  # _search_type: 0 各下拉框搜索， 1 搜索输入框搜索
  def search
    search_type = params[:_search_type].to_i

    if search_type == 0
      date = params[:_date_str]
      province = params[:_province]
      city = params[:_city]
      area = params[:_area]
      @tmp = date + " " + province + " " + city + " " + area
    else
      key_str = params[:_key_str]
      @tmp = key_str
    end



   @rand_number = rand(10000)

    respond_to do |format|
      format.js
    end

  end
end
