class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :load_tags

  protected
  def load_tags
    @tags ||= Coisa.by_tags
  end
end
