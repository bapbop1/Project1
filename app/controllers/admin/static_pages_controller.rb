class Admin::StaticPagesController < Admin::BaseController
  before_action :logged_in_user

  def home; end
end
