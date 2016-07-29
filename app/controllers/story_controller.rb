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


  def topost
    thing = params[:_thing]
    speak = params[:_speak]
    date = params[:_date]
    time = params[:_time]
    province = params[:_province]
    city = params[:_city]
    area = params[:_area]
    detail_location = params[:_detail_location]
    group = params[:_group]

    story_id = get_uuid_by_type(2)

    new_story = current_account.person.stories.create!(
        :content=>thing,
        :wantsay=>speak,
        :date_str=>date,
        :time_str=>time,
        :story_timestamp=>DateTime.now.to_i,
        :addr_province=>province,
        :addr_city=>city,
        :area=>area,
        :addr_detail=>detail_location,
        :group_str=>group,
    )

    #new_story.save

    result = 0
    message = "添加成功"

    render :js => "window.location= '#{root_path}'"

  end



end
