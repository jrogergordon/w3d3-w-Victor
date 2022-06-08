# def warmup(start_0, end_0)
#  return [] if end_0 <= start_0 
#  return end_0 if end_0 == start_0
#  n = start_0
#  [[start_0] << warmup((start_0 + 1), end_0)].flatten
# end

# p warmup(7, 32)


# # def exp_0(num, times)
# #   return 1 if times == 0
# #   num * exp_0(num, (times - 1))
# # end

#This is wrong__________________________________________________________

# def exp_1(num, times)
#   return num * num if times == 2
#   return nil if num == 0 && times == 0
#   return 1 if times == 0 || times <= 0
#   if times % 2 == 0
#     return   exp_1(num, times - 2) * exp_1(num, times - 2)
#   else
#     return exp_1(num, times - 2) * exp_1(num, times - 2)
#   end
# end

# p exp_1(7, 2)

#This is wrong ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

# def quick_sort(arr_0)
#   return arr_0 if arr_0.length <= 1
#   pivot = [arr_0.first]
#   smaller = arr_0[1..-1].select { |ele| ele < arr_0.first}
#   larger = arr_0[1..-1].select { |ele_9| ele_9 >= arr_0.first}
#   quick_sort(smaller) + pivot + quick_sort(larger)
# end



def range(start, end_0)
  return [] if start > end_0
  return [] if start == end_0
  [start] +  range(start + 1, end_0)
end

def exp_0(num, times)
  return 1 if times == 0
  return num if times == 1
  num * exp_0(num, times - 1)
end

def exp_1(num, times)
    return 1 if times < 0
    return 1 if times == 0
    return num if times == 1
    if times.even?
      return exp_1(num, times / 2) * exp_1(num, times / 2)
    else
      return exp_1(num, times / 2) * exp_1(num, times / 2) * num
    end
end


class Array
  
  def deep_dup
    copy_arr = [] #[1    ]
    self.each do |ele|
      if ele.is_a?(Array)
       copy_arr << ele.deep_dup
      else
        copy_arr << ele
      end
    end
    return copy_arr
  end
end


def fib(n)
  return [1] if n == 1
  return [1, 1] if n == 2
#    fib(n - 1) + fib(n - 2)
   #fib(2) + fib(1)
   #[1,1] + [1]
   fib(n-1) << fib(n-1)[-1] + fib(n-1)[-2]
end

def bsearch(arr, num)
  return nil if arr.length == 0
  if arr.length == 1 && arr[0] == num
    return 0
  elsif arr.length == 1 && arr[0] != num
    return nil
  end

  middle = arr.length / 2
  if arr[middle] == num
    return middle
  elsif arr[middle] > num
    bsearch(arr[0...middle], num)
  else arr[middle] < num # if target is larger than current spot
     if bsearch(arr[(middle + 1)..-1], num) == nil 
      return nil 
     else
        return middle + bsearch(arr[(middle + 1)..-1], num) + 1
     end
  end
end


def merge_sort(arr)
  return [] if arr.length == 0
  return arr if arr.length == 1

  mid = arr.length / 2
  left = merge_sort(arr[0...mid])
  right = merge_sort(arr[mid..-1])
  merge(left, right)
end
require "byebug"
def merge(left_array, right_array)
    if right_array.empty?
      return left_array
    end

    if left_array.empty?
      return right_array
    end
    empty = []
    while (!left_array.empty? || !right_array.empty?)
      if left_array.first <= right_array.first
        #smallest_number = left_array.first
      # return [[] << left_array.first.shift + merge(left_array, right_array)].flatten
      empty << left_array.shift
      else
      empty << right_array.shift #+ merge(left_array, right_array)].flatten
      end
    end
    return empty + right_array
      #[smallest_number].concat(recursive)
end

p merge_sort([3,1,7,8]) # => [1, 3, 7, 8]
p merge_sort([14,32,65,2,8,16,4,4,4]) # [2,4,4,4,8,14,16,32,65]

