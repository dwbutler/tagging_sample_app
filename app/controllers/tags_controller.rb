class TagsController < ApplicationController
  def create
    @entity = entity_type.where(id: entity_id).first_or_create
    @entity.replace_tags(params[:tags])
    render json: @entity
  end

  private

  def entity
    @entity ||= entity_type.find(entity_id)
  end

  def entity_type
    params[:entity_type].constantize
  end

  def entity_id
    params[:entity_id]
  end
end