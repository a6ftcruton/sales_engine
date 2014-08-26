class Transaction
  attr_reader :id,
              :invoice_id,
              :credit_card_number,
              :credit_card_expiration,
              :result,
              :created_at,
              :updated_at,
              :transaction_repository

  def initialize(repo, attributes = {})
    @id                      = attributes[:id].to_i
    @invoice_id              = attributes[:invoice_id].to_i
    @credit_card_number      = attributes[:credit_card_number]
    @credit_card_expiration  = attributes[:credit_card_expiration]
    @result                  = attributes[:result]
    @created_at              = attributes[:created_at]
    @updated_at              = attributes[:updated_at]
    @transaction_repository  = repo
  end

  def invoice
    transaction_repository.find_invoice_by_invoice_id(invoice_id)
  end
end
