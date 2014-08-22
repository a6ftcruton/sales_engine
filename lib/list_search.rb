module ListSearch
  def all
    self.collection
  end

  def random
    all.sample
  end

  def find_by(criteria)
    attribute = criteria.keys.first
    value     = criteria.values.first
    collection.find { |record| record.send(attribute).downcase == value.downcase }
  end

  def find_all_by(criteria)
    attribute = criteria.keys.first
    value     = criteria.values.first
    collection.find_all { |record| record.send(attribute).downcase == value.downcase }
  end
end
