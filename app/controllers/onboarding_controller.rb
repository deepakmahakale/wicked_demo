class OnboardingController < ApplicationSecuredController
  include Wicked::Wizard

  steps :basic_details, :personal_details, :address_details
  before_action :set_progress, only: [:show]
  before_action :set_ui_progress, only: [:show]

  def show
    @user = User.last || User.new
    case step
    when :address_details
      @address = @user.address || @user.build_address
    end
    render_wizard
  end

  def update
    @user = User.last || User.new
    case step
    when :address_details
      @address = @user.address || @user.build_address
      @address.update(address_params)
      render_wizard @address
    else
      @user.update(user_params)
      render_wizard @user, context: step
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

  def set_progress
    @progress = if wizard_steps.any? && wizard_steps.index(step).present?
                  ((wizard_steps.index(step) + 1).to_d / wizard_steps.count.to_d) * 100
                else
                  0
                end
  end

  def set_ui_progress
    @ui_progress = if wizard_steps.any? && wizard_steps.index(step).present?
                     multiplier = 100 / (wizard_steps.count - 1)
                     wizard_steps.index(step) * multiplier
                   else
                     0
                   end
  end
end
