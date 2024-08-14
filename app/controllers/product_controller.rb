class ProductController < ApplicationController
  def index
    @phones = Phone.all
    render "index"
  end

  def details
    @phone_details = PhoneDetail.find_by(phone_id: params[:id])
    @phone = Phone.find(params[:id])

    unless @phone
      flash[:alert] = "Lỗi tí"
      redirect_to root_path
      return
    end
    unless @phone_details
      flash[:alert] ="Chưa có thông tin gì về sản phẩm này"
      redirect_to root_path
      return
    end

    @images = Image.where(phone_details_id: @phone_details.phone_details_id)
    unless @images
      flash[:alert] = "Lỗi"
      redirect_to root_path
      return
    end
    render "details"
  end

end
