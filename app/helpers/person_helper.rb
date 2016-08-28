# coding: utf-8
module PersonHelper
  def get_head_icon_url(account_id)

  end

  # 根据账户ID获取一个账户
  def get_account(account_id)
    UserAccount.find_by_account_id(account_id)
  end

  # 根据刘洋创建时间与现在时间对比，给出留言的时间显示
  def get_memory_time(created_time)
    diff_time = (Time.now - created_time).to_i
    if diff_time < 36000
      hours = diff_time / 3600
      diff_time = diff_time % 3600
      minutes = diff_time / 60
      diff_time = diff_time % 60
      seconds = diff_time

      if hours == 0 && minutes == 0
        return "刚刚"
      elsif hours == 0 && minutes != 0
        return minutes.to_s + " 分钟前"
      elsif hours != 0 && minutes == 0
        return hours.to_s + " 小时前"
      else
        return hours.to_s + "小时" + minutes.to_s + "分钟前"
      end
    else
      return created_time
    end
  end
end
