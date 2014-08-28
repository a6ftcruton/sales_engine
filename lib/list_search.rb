module ListSearch
  def all
    collection
  end

  def random
    all.sample
  end

  def find_by(criteria)
    attribute = criteria.keys.first
    value     = criteria.values.first
    collection.find { |record| record.send(attribute) == value }
  end

  def find_all_by(criteria)
    attribute = criteria.keys.first
    value     = criteria.values.first
    collection.find_all { |record| record.send(attribute) == value }
  end

  def inspect
    "<# #{self.class} #{collection.count} rows >"
  end
end
