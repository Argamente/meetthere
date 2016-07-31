class StoryController < ApplicationController
  def post

    if !signed_in?
      redirect_to signin_url
      return
    end


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

    date_year = params[:_date_year].to_i
    date_month = params[:_date_month].to_i
    date_day = params[:_date_day].to_i
    time_hour = params[:_time_hour].to_i
    time_minute = params[:_time_minute].to_i

    province = params[:_province]
    city = params[:_city]
    area = params[:_area]
    detail_location = params[:_detail_location]
    group = params[:_group]

    timestamp = DateTime.new(date_year,date_month,date_day,time_hour,time_minute,0,"+8").to_i
    now_timestamp = DateTime.now.to_i

    if timestamp < now_timestamp
      render :json=>{
                 :result=>1,
                 :message=>"时间错误，无法在历史中创造遇见",
                 :nowtime=>now_timestamp,
                 :time=>timestamp,
             }

      return
    end


    story_id = get_uuid_by_type(2)

    new_story = current_account.person.stories.create!(
        :content=>thing,
        :wantsay=>speak,
        :date_str=>date,
        :time_str=>time,
        :story_timestamp=>timestamp,
        :addr_province=>province,
        :addr_city=>city,
        :area=>area,
        :addr_detail=>detail_location,
        :group_str=>group,
        :story_id=>story_id,
        :date_year=>date_year,
        :date_month=>date_month,
        :date_day=>date_day,
        :time_hour=>time_hour,
        :time_minute=>time_minute,
    )

    #new_story.save

    result = 0
    message = "添加成功"

    render :js => "window.location= '#{root_path}'"

  end



end
