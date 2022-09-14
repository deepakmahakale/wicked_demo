class OnboardingController < ApplicationController
  include Wicked::Wizard

  steps :basic_details, :personal_details, :address_details

  def show
    @user = User.last || User.new
    case step
    when :address_details
      @address = @user.build_address
    end
    render_wizard
  end

  def update
    @user = User.last || User.new
    case step
    when :address_details
      @address = @user.address || @user.build_address
      @address.update(address_params)
    end

    render_wizard @user
  end
end
