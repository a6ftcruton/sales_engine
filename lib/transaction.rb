class Transaction
  attr_reader :id,
              :invoice_id,
              :credit_card_number,
              :credit_card_expiration,
              :result,
              :created_at,
              :updated_at

  def initialize(attributes = {}, repo)
    @id                      = attributes[:id]
    @invoice_id              = attributes[:invoice_id]
    @credit_card_number      = attributes[:credit_card_number]
    @credit_card_expiration  = attributes[:credit_card_expiration]
    @result                  = attributes[:result]
    @created_at              = attributes[:created_at]
    @updated_at              = attributes[:updated_at]
    @transaction_repo        = repo
  end
end
