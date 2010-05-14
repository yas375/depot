require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "invalid with empty attributes" do
    product = Product.new
    assert !product.valid?
    assert product.errors.invalid?(:title)
    assert product.errors.invalid?(:description)
    assert product.errors.invalid?(:price)
    assert product.errors.invalid?(:image_url)
  end


  test "positive price" do
    product = Product.new(:title => "My Book Title",
                          :description => "yyy",
                          :image_url => "zzz.jpg" )

    product.price = -1
    assert !product.valid?
    assert_equal "Must be more then zero" , product.errors.on(:price)

    product.price = 0
    assert !product.valid?
    assert_equal "Must be more then zero" , product.errors.on(:price)

    product.price = 1
    assert product.valid?
  end

  test "image url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }

    ok.each do |name|
      product = Product.new(:title => "My Book Title" ,
                            :description => "yyy" ,
                            :price => 1,
                            :image_url => name)
      assert product.valid?, product.errors.full_messages
    end

    bad.each do |name|
      product = Product.new(:title => "My Book Title" ,
                            :description => "yyy" ,
                            :price => 1,
                            :image_url => name)
      assert !product.valid?, "saving #{name}"
    end
  end


end
