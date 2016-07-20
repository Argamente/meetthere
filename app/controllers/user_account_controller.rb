class UserAccountController < ApplicationController

    #登录和注册
    def signinup

    end

    # 登录
    def signin

    end
    
    # 登录认证
    def to_signin

    end

    # 注册
    def signup

    end

    # 注册认证
    def tosignup




        message = "Hey bro, 登录后才能记录近况的，你是怎么做到不登录就发表近况的？"
        render :json=>{
                   :result=>-1,
                   :message=>message,
               }
    end

end
