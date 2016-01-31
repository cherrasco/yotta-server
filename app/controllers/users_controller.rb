class UsersController < ApiBaseController

  before_action :set_user, only: :latest_drive_id

  def latest_drive_id
    respond_to do |format|
      format.text { render text: @user.drives.pluck(:id).last }
      format.json { render json: { drive_id: @user.drives.pluck(:id).last } }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
