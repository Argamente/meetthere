module UuidHelper

 # 0 account_id   1 person_id   2 story_id   3 memory_id
  def get_uuid_by_type(type)
    default_uuid = 100000000
    uuid_data = Uuid.first
    if uuid_data.nil?
      uuid_data = Uuid.new
      uuid_data.account_id = default_uuid
      uuid_data.person_id = default_uuid
      uuid_data.story_id = default_uuid
      uuid_data.memory_id = default_uuid
      uuid_data.save
      return default_uuid
    end

    result = default_uuid
    case type
      when 0
        if uuid_data.account_id.nil?
          result = default_uuid
        else
          result = uuid_data.account_id + 1
        end
        uuid_data.update(:account_id=>result)
      when 1
        if !uuid_data.person_id.nil?
          result = uuid_data.person_id + 1
        end
        uuid_data.update(:person_id=>result)
      when 2
        if !uuid_data.story_id.nil?
          result = uuid_data.story_id + 1
        end
        uuid_data.update(:story_id=>result)
      when 3
        if !uuid_data.memory_id.nil?
          result = uuid_data.memory_id + 1
        end
        uuid_data.update(:memory_id=>result)
    end

    return result
  end
end