class StatsController < ApplicationController
  include EntityAttributes

  def index
    tag_counts = Tag.group(:name).count
    stats = tag_counts.map { |tag, count| { tag: tag, count: count } }
    render json: stats
  end

  def show
    stats = entity.tag_list.map { |tag| { tag: tag, count: 1 } }
    render json: stats
  end
end
