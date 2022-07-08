# frozen_string_literal: true

class PageController < ApplicationController
  def home
    redirect_to articles_url if loggined_in?
  end

  def about; end

  def contact; end
end
