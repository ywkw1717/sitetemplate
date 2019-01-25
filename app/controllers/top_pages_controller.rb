class TopPagesController < ApplicationController
  def index
  end

  def about
  end

  def top3
    Content.all.order('view DESC').take(3)
  end

  def new_post
    Content.all.order('created_at DESC').take(1)
  end

  helper_method :top3, :new_post
end
