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
    # Keep in mind that this should be the default algorithm
    # for the classic Array::sort (as far as I know)
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
      while i < s
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
          while j > 0 && a[j - 1] > t
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
      n = a.size  
      a = [nil] + a
      (n / 2).downto(1) do |i|  
        down_heap(a, i, n)  
      end  
      while n > 1  
        a[1], a[n] = a[n], a[1]  
        n -= 1  
        down_heap(a, 1, n)  
      end  
      
      a.drop(1)
    end
    
    # Merge sort
    # Params:
    # +a+:: array to sort
    def merge_sort(a)
      return a if a.size <= 1 
      m = a.size / 2
      l = merge_sort(a[0, m])
      r = merge_sort(a[m, a.size - m])
      
      merge(l, r)
    end
    
  private    
    def swap(a, i, j)
      a[i], a[j] = a[j], a[i]
    end
  
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
    
    def down_heap(a, p, l)  
      wk = a[p]  
      while (c = 2 * p) <= l  
        c += 1  if c < l && a[c] < a[c + 1]
        break  if wk >= a[c]  
        a[p] = a[c]  
        p = c  
      end  
      
      a[p] = wk  
    end
  
    def merge(l, r)
      s = Array.new
      while l.size > 0 && r.size > 0
        if l.first <= r.first
          s << l.shift
        else
          s << r.shift
        end
      end
      
      s.concat(l).concat(r)
    end
  end

  # Static module methods
  class << self
    def bubble_sort(array)
      Sorter.new.bubble_sort(array)
    end

    def quick_sort(array)
      Sorter.new.quick_sort(array, 0, array.size - 1)
    end

    def gnome_sort(array)
      Sorter.new.gnome_sort(array)
    end

    def insertion_sort(array)
      Sorter.new.insertion_sort(array)
    end

    def heap_sort(array)
      Sorter.new.heap_sort(array)
    end

    def merge_sort(array)
      Sorter.new.merge_sort(array)
    end
  end
end
