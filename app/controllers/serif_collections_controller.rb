class SerifCollectionsController < ApplicationController
  def index
  end

  def short
    @serifs = Serif.page(params[:p]).order('created_at DESC')
  end
end
