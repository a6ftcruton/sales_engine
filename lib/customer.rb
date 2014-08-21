class Customer
  attr_reader :id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at

  def initialize(attributes = {}, repo)
    @id            = attributes[:id]
    @first_name    = attributes[:first_name]
    @last_name     = attributes[:last_name]
    @created_at    = attributes[:created_at]
    @updated_at    = attributes[:updated_at]
    @customer_repo = repo
  end
  #
  # def ==(attributes)
  #   last_name == attributes.last_name
  #   first_name == attributes.first_name
  # end
end
