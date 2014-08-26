require 'csv'
require_relative '../customer'
require_relative '../list_search'

class CustomerRepo
  include ListSearch

  attr_reader :collection,
              :sales_engine

  def initialize(engine, customers_data)
    @collection   = customers_data.map { |row| Customer.new(self, row) }
    @sales_engine = engine
  end

  def inspect
    "<# #{self.class} #{collection.count} rows >"
  end

  def find_by_id(id)
    find_by id: id
  end

  def find_by_first_name(first_name)
    find_by first_name: first_name
  end

  def find_by_last_name(last_name)
    find_by last_name: last_name
  end

  def find_by_created_at(created_at)
    find_by created_at: created_at
  end

  def find_by_updated_at(updated_at)
    find_by updated_at: updated_at
  end

  def find_all_by_id(id)
    find_all_by id: id
  end

  def find_all_by_first_name(name)
    collection.find_all do |customer|
      customer.first_name == name
    end
  end

  def find_all_by_last_name(name)
    collection.find_all do |customer|
      customer.last_name == name
    end
  end

  def find_all_by_created_at(created_at)
    find_all_by created_at: created_at
  end

  def find_all_by_updated_at(updated_at)
    find_all_by updated_at: updated_at
  end

  def find_invoices_by_customer_id(id)
    sales_engine.find_invoices_by_customer_id(id)
  end

  def find_customer_by_customer_id(id)
    collection.find do |customer|
      customer.id == id
    end
  end
end
