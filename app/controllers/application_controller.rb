class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  helper_method :user_signed_in?, :current_user

  private

  def record_not_found
    # render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
    render file: Rails.root.join("public", "404.html"),
           layout: false,
           status: :not_found
  end
  def user_signed_in?
    session[:_user_resume_dev_].present?
  end

  def current_user
    return User.find_by(id: session[:_user_resume_dev_]) if user_signed_in?

    return nil
  end

  def authenticate_user!
    redirect_to sign_in_users_path if not user_signed_in?
  end
end
