class UserAccountController < ApplicationController

    #登录和注册
    def signinup

    end

    # 登录
    def signin

    end
    
    # 登录认证
    def tosignin
      email = params[:_email].downcase
      password = params[:_password]

      userAccount = UserAccount.find_by_email(email)
      if userAccount
          key = Digest::SHA1.hexdigest(password)
          if key == userAccount.password
              sign_in userAccount
              result = 0
          else
            message = "密码错误"
            result = 1
          end
      else
        message = "邮箱未注册"
        result = 1
      end


      if result == 0
        render :js => "window.location= '#{root_path}'"     #stackoverflow上的解决方案，也可以把url返回给ajax，然后在view中去重定向页面
      else
        render :json=>{
                   :result=>result,
                   :message=>message,
               }
      end

    end


    def signout
      sign_out
      redirect_to root_url
    end


    # 注册
    def signup

    end

    # 注册认证
    def tosignup
        nickname = params[:_nickname]
        email = params[:_email]
        password = params[:_password]
        gender = params[:_gender].to_i

        if UserAccount.exists?(email:email) == false
            new_account = UserAccount.new
            new_account.account_id = get_uuid_by_type(0)
            new_account.email = email
            new_account.password = password
            new_account.person = Person.new
            new_account.person.nickname = nickname
            new_account.person.gender = gender

            if new_account.save
                message = "Register Successful"
                result = 0
            else
              message = "Register faild"
              result = 1
            end

        else
          message = "账户已经存在"
          result = 1
        end



        render :json=>{
                   :result=>result,
                   :message=>message,
               }
    end

end
