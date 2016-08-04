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

  end
end



