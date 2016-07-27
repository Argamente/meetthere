class StoryController < ApplicationController
  def post
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
  end
end
