class PagesController < ApplicationController
  before_filter :authenticate_teacher!
  def home
  end
end
