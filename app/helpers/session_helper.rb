module SessionHelper
  def sign_in(userAccount)
    remember_token = UserAccount.account_new_remember_token
    cookies.permanent[:meetthere_remember_token] = remember_token
    userAccount.update_attribute(:remember_token,UserAccount.encrypt(remember_token))
    self.current_account = userAccount
  end

  def current_account=(userAccount)
    @current_account = userAccount
  end

  def signed_in?
    !current_account.nil?
  end

  def is_master_user(account_id)
    return signed_in? && current_account.account_id == account_id
  end

  def current_account?(userAccount)
    userAccount == current_account
  end

  def current_account
    remember_token = UserAccount.encrypt(cookies[:meetthere_remember_token])
    @current_account ||= UserAccount.find_by(remember_token: remember_token)
  end

  def signed_in_account
    unless signed_in?
      store_location
      redirect_to signin_url, notice:"Please sign in"
    end
  end

  def sign_out
    self.current_account = nil
    cookies.delete(:meetthere_remember_token)
  end

  def store_location
    session[:return_to] = request.fullpath
  end

end