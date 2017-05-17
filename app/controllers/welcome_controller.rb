class WelcomeController < ApplicationController
  layout "welcome"

  def index
    @intros = Intro.published
  end
end
