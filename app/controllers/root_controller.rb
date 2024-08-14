

class RootController < ApplicationController
  def index
    @category = PhoneCategory.find(3)
    @tablets = @category.phones.max(4)
    @phones = Phone.includes(:phone_details).all
    render "index"
  end
  def contact
    render "index"
  end

  
     
end
