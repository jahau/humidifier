require 'test_helper'

class ResourceTest < Minitest::Test
  AwsCF::Resource.props = {
    'one' => AwsCF::Props::StringProp.new('One'),
    'two' => AwsCF::Props::IntegerProp.new('Two')
  }
  AwsCF::Resource.aws_name = 'AWS::Resource'

  def test_method_missing_reader
    resource = build
    assert_equal 'one', resource.one
  end

  def test_method_missing_writer
    resource = build
    resource.one = 'three'
    assert_equal 'three', resource.one
  end

  def test_respond_to_missing?
    resource = build
    AwsCF::Resource.props.keys.each do |key|
      assert resource.respond_to?(key)
      assert resource.respond_to?("#{key}=")
    end
  end

  def test_respond_to_missing_invalid
    resource = build
    assert_raises NoMethodError do
      resource.foo
    end
  end

  def test_to_cf
    resource = build
    assert_equal ({ 'Type' => 'AWS::Resource', 'Properties' => { 'One' => 'one', 'Two' => 2 } }), resource.to_cf
  end

  def test_update
    assert_equal ({ 'one' => 'one', 'two' => 2 }), build.properties
  end

  def test_update_property
    resource = build
    resource.update_property('one', 'three')
    assert_equal ({ 'one' => 'three', 'two' => 2 }), resource.properties
  end

  def test_update_property_invalid
    resource = build
    assert_raises ArgumentError do
      resource.update_property('one', 1)
    end
  end

  private

    def build
      AwsCF::Resource.new(one: 'one', two: 2)
    end
end
