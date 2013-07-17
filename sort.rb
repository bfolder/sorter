module Sort
  class Sorter
    # Bubble sort
    # Params:
    # +a+:: array to sort
    def bubble_sort(a)
      n = a.size
      begin 
        m = 1
        0.upto(n - 2) do |i|
          if a[i] > a[i + 1]
            swap(a, i, i + 1)
            m = i + 1
  	      end	  
        end
        n = m
      end while n > 1
      
      a
    end  
    
    # Quick sort
    # Left & right can be 0 & a.size - 1
    # Params:
    # +a+:: array to sort
    # +l+:: index of first object
    # +r+:: index of last object
    def quick_sort(a, l, r)
      if l < r
      	d = partition(a, l, r)
      	quick_sort(a, l, d - 1)
      	quick_sort(a, d + 1, r)
      end
      
      a    	    
    end
    
    # Gnome sort
    # Params:
    # +a+:: array to sort
    def gnome_sort(a)
      i, j = 0, 0
      s = a.size - 1
      while i < s do
        if a[i] <= a[i + 1]
          j = j + 1
          i = j
        else
          swap(a, i, i + 1)
          i = i - 1
          i = 0 if i < 0
        end
      end
      
      a
    end
    
    # Insertion sort
    # Params:
    # +a+:: array to sort
    def insertion_sort(a)
      1.upto(a.size - 1) do |i|
        if a[i] < a[i - 1]
          t = a[i]
          j = i
          while j > 0 && a[j - 1] > t do
            a[j] = a[j- 1]
            j = j - 1
          end
          a[j] = t
	      end	  
      end
      
      a
    end
    
    # Heap sort
    # Params:
    # +a+:: array to sort
    def heap_sort(a)
      
      a
    end
    
    # Merge sort
    # Params:
    # +a+:: array to sort
    def merge_sort(a)
      
      a
    end
    
  private
    def partition(a, l, r)
      i, j = l, (r - 1)
      pvt = a[r]      
      begin 
        i = i + 1 while a[i] <= pvt && i < r     
        j = j - 1 while a[j] >= pvt && j > l

        swap(a, i, j) if i < j  
      end while i < j 
      swap(a, i, r) if a[i] > pvt
      
      i
    end
    
    def swap(a, i, j)
      a[i], a[j] = a[j], a[i]
    end
  end

  # Static module methods
  def self.bubble_sort(array)
    Sorter.new.bubble_sort(array)
  end
  
  def self.quick_sort(array)
    Sorter.new.quick_sort(array, 0, array.size - 1) 	    
  end
  
  def self.gnome_sort(array)
    Sorter.new.gnome_sort(array)
  end
  
  def self.insertion_sort(array)
    Sorter.new.insertion_sort(array)
  end
  
  def self.heap_sort(array)
    Sorter.new.heap_sort(array)
  end
  
  def self.merge_sort(array)
    Sorter.new.merge_sort(array)
  end
end