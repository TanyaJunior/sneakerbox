class SessionsController < ApplicationController
  def destroy
    # Clear the user's session by resetting the session hash
    session.clear

    # Redirect to the desired page after sign-out
    redirect_to root_path, notice: 'Signed out successfully.'
  end
end
