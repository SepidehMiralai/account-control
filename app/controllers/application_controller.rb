
class ApplicationController < ActionController::Base
  before_action :set_current_user

  private

  def set_current_user
    if (legal_person_signed_in?)
      @current_user = current_legal_person
    elsif (person_signed_in?)
      @current_user = current_person
    end
  end

end
