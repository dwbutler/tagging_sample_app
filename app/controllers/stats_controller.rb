class StatsController < ApplicationController
  def index
    tag_counts = Tag.group(:name).count
    stats = tag_counts.map { |tag, count| { tag: tag, count: count } }
    render json: stats
  end
end
