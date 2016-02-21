module EntityAttributes
  extend ActiveSupport::Concern

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
