module ListSearch

  def all(instance)
    return instance
  end

  def random(instance)
    instance.sample
  end

  def find_by(criteria)
    attribute = criteria.keys.first
    value     = criteria.values.first
    collection.find { |record| record.send(attribute).downcase == value.downcase }
  end
end
