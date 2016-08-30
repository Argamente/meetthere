# coding: gb2312
class PersonController < ApplicationController
  def show
    person_id = params[:id].to_i

    userAccount = UserAccount.find_by_account_id(person_id)
    if userAccount.nil?
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404
      return
    else
      @person = userAccount.person
    end

    @is_master_user = is_master_user(person_id)

    @stories = userAccount.person.stories  

  end


  def topost_memory_at_person
   if !signed_in?
      render :json=>{
                 :result=>1,
                 :message=>"尚未登录，无法留言",
             }

      return
   end

   story_id = params[:_story_id].to_i
   
   if params[:_main_memory_id].nil? || params[:_main_memory_id] == ""
     main_memory_id = -1
   else
     main_memory_id = params[:_main_memory_id].to_i
   end
   
   content = params[:_content]
   curr_story = Story.find_by_story_id(story_id)
   if curr_story.nil?
     result = 1
     message = "未找到指定的活动"
   else
     memory_id = get_uuid_by_type(3)
     account_id = current_account.account_id
     curr_story.memories.create!(:story_id=>story_id,
                                 :content=>content,
                                 :memory_id=>memory_id,
                                 :account_id=>account_id,
                                 :main_memory_id=>main_memory_id,
                                )

     result = 0
     message = "添加留言成功"
   end
    render :json=>{
               :result=>result,
               :message=>message,
           }
  end


  
end



