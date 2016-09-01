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

    # Store every main memory of story
    @main_memories = Hash.new
    # Story every sub memory of Main memory
    @sub_memories = Hash.new

    @stories.each do |story|
      # get all memory of story
      memory_array = story.memories
      memory_array.each do |memory|
        # check if the story id doesn't contain in main_memory hash, Just create it
        if @main_memories[story.story_id].nil?
          @main_memories[story.story_id] = Array.new
        end
        # check if the memory is a main memory
        if memory.main_memory_id.nil? || memory.main_memory_id == -1
          # push the main memory into hash 
          @main_memories[story.story_id].push(memory)
        else
          if @sub_memories[memory.main_memory_id].nil?
            @sub_memories[memory.main_memory_id] = Array.new
          end
          @sub_memories[memory.main_memory_id].push(memory)
        end
      end
    end
    

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


  def to_delete_memory
    memory_id = params[:_memory_id].to_i
    flash[:memory_id] = memory_id
    current_memory = Memory.find_by_memory_id(memory_id)
    if !current_memory.nil?
      if current_memory.main_memory_id.nil? || current_memory.main_memory_id == -1
        sub_memories = Memory.where(:main_memory_id=>current_memory.memory_id)

        if !sub_memories.nil?
          sub_memories.each do |sub_memory|
            sub_memory.destroy
          end
        end
      end
       current_memory.destroy
      result = 0
      message = "删除成功"
    else
      result = 1
      message = "删除失败，未找到指定id的留言"
    end

    render :json=>{
             :result=>result,
             :message=>message,
           }
  end


  
end



