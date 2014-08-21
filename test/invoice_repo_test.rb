require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/repo/invoice_repo'

class InvoiceRepoTest < Minitest::Test
  def self.repo
    @repo ||= SalesEngine.new.invoice_repo
  end

  def repo
    self.class.repo
  end

end
