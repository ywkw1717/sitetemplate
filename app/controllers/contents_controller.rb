class ContentsController < ApplicationController
  def index
    if params[:order]
      order = params[:order]
    elsif session[:order]
      order = session[:order]
    else
      order = '1'
    end

    if order == '1'
      @selected = '1'
      session[:order] = '1'

      @contents = Content.page(params[:p]).order('updated_at DESC')
    elsif order == '2'
      @selected = '2'
      session[:order] = '2'

      @contents = Content.page(params[:p]).order('view DESC')
    elsif order == '3'
      @selected = '3'
      session[:order] = '3'

      @contents = Content.page(params[:p]).order('good DESC')
    elsif order == '4'
      @selected = '4'
      session[:order] = '4'

      @contents = Content.page(params[:p]).order('comment DESC')
    else
      @selected = '1'

      @contents = Content.page(params[:p]).order('updated_at DESC')
    end
  end
end
