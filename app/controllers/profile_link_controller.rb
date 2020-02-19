class ProfileLinkController < ApplicationController
    def create

        current_user.profile_link = ProfileLink.new()
        current_user.profile_link.update(profile_link_update_params)
    end

    def update
        profile_to_update = ProfileLink.find(params[:profile_link][:id])
        profile_to_update.update(profile_link_update_params)
    end
  @private
  def profile_link_create_params
    params.require(:profile_link).permit(:twitter_url,:note_url,:website_url,:organization)
  end
  def profile_link_update_params
    params.require(:profile_link).permit(:twitter_url,:note_url,:website_url,:organization)
  end
end
