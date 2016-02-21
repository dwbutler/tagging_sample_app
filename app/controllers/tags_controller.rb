class TagsController < ApplicationController
  include EntityAttributes

  def create
    @entity = entity_type.where(id: entity_id).first_or_create
    @entity.replace_tags(params[:tags])
    render_entity
  end

  def show
    render_entity
  end

  def destroy
    entity.destroy
    head :no_content
  end

  private

  def render_entity
    render json: {
      entity: entity,
      tags: entity.tag_list
    }
  end
end
