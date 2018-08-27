class HomeController < ApplicationController
  def index
    @projects = Project.all
    @IntroImages = IntroImage.all
  end
end
