class QueueItemsController < ApplicationController
  before_filter :authenticate_user

  def index
    @queue_items = QueueItem.all
  end

  def create
    @queue_item = QueueItem.new(queue_item_create_params)
    if @queue_item.save
      redirect_to my_queue_path
    else
      render :index
    end
  end

  def update
    QueueItem.update_all_items(params[:queue_items])
    redirect_to my_queue_path 
  end

  def destroy
    id = params[:id]
    QueueItem.find(id).destroy
    flash[:warning] = "Your queue item has been deleted"
    redirect_to my_queue_path
  end

  private
  def queue_item_params
    params.require(:queue_items)
  end

  def queue_item_create_params
    params.require(:queue_item).permit!
  end
end