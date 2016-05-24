require 'test_helper'

class UtilsTest < Minitest::Test

  def test_enumerable_to_h
    actual = Humidifier::Utils.enumerable_to_h(%w[a b c d]) { |item| [item.to_sym, item.ord] }
    assert_equal ({ a: 97, b: 98, c: 99, d: 100 }), actual
  end

  def test_underscore
    assert_equal 'foo',               Humidifier::Utils.underscore('Foo')
    assert_equal 'foo_bar',           Humidifier::Utils.underscore('FooBar')
    assert_equal 'foo_bar_baz',       Humidifier::Utils.underscore('FooBarBaz')
    assert_equal 'foofoofoofoo_baar', Humidifier::Utils.underscore('FoofoofoofooBaar')
  end

  def test_underscored_empty
    assert_equal ({}), Humidifier::Utils.underscored({})
  end

  def test_underscored
    response = Humidifier::Utils.underscored(%w[TestA TestB])
    assert_equal ({ 'TestA' => :test_a, 'TestB' => :test_b }), response
    assert response.frozen?
  end
end
