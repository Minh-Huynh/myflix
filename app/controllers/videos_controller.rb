class VideosController < ApplicationController
  before_action :authenticate_user
  def index
    @categories = Category.all
  end

  def show
    @video = Video.find(params[:id])
    @review = Review.new
  end

  def search
    @results = Video.search_by_title(params[:query])
  end
  
end