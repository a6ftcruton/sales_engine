require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/sales_engine'
require_relative '../lib/list_search'

class DummyList
  include ListSearch

  def collection
    [
     DummyObject.new('poptart', 'space', 'delicious'),
     DummyObject.new('hotdogs', 'your mouth', 'delicious'),
     DummyObject.new('pizza', 'party', 'delicious'),
     DummyObject.new('pizza', 'lunch', 'delicious')
    ]
  end
end

class DummyObject
  attr_accessor :name, :location, :taste

  def initialize(name, location, taste)
    @name = name
    @location = location
    @taste = taste
  end
end

class ListSearchTest < Minitest::Test
  attr_accessor :dl

  def setup
    @dl = DummyList.new
  end

  def test_it_finds_all
    assert_equal dl.all.count, dl.collection.count
  end

  def test_it_returns_random_object
    refute_nil dl.random
    assert_kind_of Object, dl.random
    assert dl.random.respond_to?(:name)
  end

  def test_it_finds_by
    assert_equal "poptart", dl.find_by(name: 'poptart').name
    assert_equal "space", dl.find_by(location: 'space').location
  end

  def test_it_finds_all_by
    assert_equal 2, dl.find_all_by(name: 'pizza').count
    assert_equal 4, dl.find_all_by(taste: 'delicious').count
  end
end
