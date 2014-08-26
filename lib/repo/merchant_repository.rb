class MerchantRepo
  include ListSearch

  attr_reader :collection,
              :sales_engine

  def initialize(engine, merchant_data)
    @collection   = merchant_data.map { |row| Merchant.new(self, row) }
    @sales_engine = engine
  end

  def find_by_id(id)
    find_by id: id
  end

  def find_by_name(name)
    find_by name: name
  end

  def find_by_updated_at(updated_at)
    find_by updated_at: updated_at
  end

  def find_by_created_at(created_at)
    find_by created_at: created_at
  end

  def find_all_by_id(id)
    find_all_by id: id
  end

  def find_all_by_name(name)
    find_all_by name: name
  end

  def find_all_by_created_at(created_at)
    find_all_by created_at: created_at
  end

  def find_all_by_updated_at(updated_at)
    find_all_by updated_at: updated_at
  end

  def find_invoices_by_merchant_id(id)
    @sales_engine.find_invoices_by_merchant_id(id)
  end

  def find_items_by_merchant_id(id)
    @sales_engine.find_items_by_merchant_id(id)
  end

  def find_merchant_by_merchant_id(id)
    collection.find do |merchant|
      merchant.id == id
    end
  end

  def find_all_invoices_by_merchant_id_matching_invoice_merchant_id(merchant_id)
    collection.find do |merchant|
      merchant.id == merchant_id
    end
  end
end
