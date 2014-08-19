module ListSearch

  def all(instance)
    return instance
  end

  def random(instance)
    instance.sample
  end

  def find_by(criteria = {})
    search_key = criteria.keys.first
    search_value = criteria.values.first
    collection.find { |record| record.public_send(search_key) == search_value}
  end
end
