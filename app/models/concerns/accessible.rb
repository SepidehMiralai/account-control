module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_person
    before_action :check_legal_person
  end

  protected
  def check_person
    if current_legal_person
      flash.clear
      redirect_to(rails_legal_person.dashboard_path) and return
    elsif current_person
      flash.clear
      # The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
      redirect_to(authenticated_person_root_path) and return
    end
  end

  def check_legal_person
    if current_person
      flash.clear
      redirect_to(rails_person.dashboard_path) and return
    elsif current_legal_person
      flash.clear
      # The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
      redirect_to(authenticated_legal_person_root_path) and return
    end
  end
end