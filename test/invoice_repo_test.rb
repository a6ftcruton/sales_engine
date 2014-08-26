require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/repo/invoice_repository'

class InvoiceRepoTest < Minitest::Test
  def self.repo
    @repo ||= SalesEngine.new.startup.invoice_repository
  end

  def repo
    self.class.repo
  end

end
