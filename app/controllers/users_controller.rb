class UsersController < ApiBaseController

  before_action :set_user, only: :latest_drive_id

  def latest_drive_id
    render text: @user.drives.pluck(:id).last
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
