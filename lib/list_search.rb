module ListSearch
  def all(instance)
    return instance
  end

  def all
    self.collection
  end

  def random # <-- omg, test me ;)
    self.collection.sample
  end

  def find_by(criteria)
    attribute = criteria.keys.first
    value     = criteria.values.first
    collection.find { |record| record.send(attribute).downcase == value.downcase }
  end
end
