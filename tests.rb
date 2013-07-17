require './sorter.rb'
require 'test/unit'

class TestCaseSorter < Test::Unit::TestCase
  def test_bubble_sort
    assert_equal(Sort.bubble_sort([5,2,5,65,10,4,2,8,2,3,1]), [1,2,2,2,3,4,5,5,8,10,65])
  end

  def test_quick_sort
    assert_equal(Sort.quick_sort([5,2,5,65,10,4,2,8,2,3,1]), [1,2,2,2,3,4,5,5,8,10,65])
  end
  
  def test_gnome_sort
     assert_equal(Sort.gnome_sort([5,2,5,65,10,4,2,8,2,3,1]), [1,2,2,2,3,4,5,5,8,10,65])
  end
   
  def test_insertion_sort
      assert_equal(Sort.insertion_sort([5,2,5,65,10,4,2,8,2,3,1]), [1,2,2,2,3,4,5,5,8,10,65])
  end
  
  def test_heap_sort
      assert_equal(Sort.heap_sort([5,2,5,65,10,4,2,8,2,3,1]), [1,2,2,2,3,4,5,5,8,10,65])
  end
end
