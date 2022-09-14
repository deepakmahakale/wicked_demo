class OnboardingController < ApplicationController
  include Wicked::Wizard

  steps :basic_details, :personal_details, :address_details

  def show
    @user = User.last || User.create
    case step
    when :address_details
      @address = @user.address || @user.build_address
    end
    render_wizard
  end

  def update
    @user = User.last || User.create
    case step
    when :address_details
      @address = @user.address || @user.build_address
      @address.update(address_params)
      @address.errors.add(:address_line1, 'error')
      render_wizard @address
    else
      @user.update(user_params)
      render_wizard @user
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :age, :gender, :date_of_birth
    )
  end

  def address_params
    params.require(:address).permit(
      :address_line1, :address_line2, :zip, :city, :country_code
    )
  end
end
