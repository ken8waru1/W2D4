list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

#Phase1 check every other element 
def my_min(list)
  # res = list.first
  list.each_with_index do |el, i|
      return el if list.all? {|e| el <= e}
  end
end

def my_min2(list)
  min = 0

  list.each do |el|
    min = el if min > el
  end

  min
end

# def largest_contiguous_sum(list)
#   sub_arrays = []
#   list.each_with_index do |el1, i|
#     (i...list.length).each_with_index do |el2, j|
#       sub_arrays << list[i..j] if j >= i
#     end
#   end
#   sub_arrays
# end

def lcs(list)
  sub_arrays = []
  list.each_with_index do |el1, idx1|
    sub_arrays << [el1]
    list.each_with_index do |el2, idx2|
      sub_arrays << sub_arrays[-1] + [el2] if idx2 > idx1
    end
  end
  sub_arrays
  sub_arrays.map {|sub| sub.sum }.max

end
require 'byebug'
def lcs_better(list)
  cs = 0
  ls = list.first

  list.each do |ele|
    # debugger
    if ele > cs + ele
      cs = ele
    else
      cs += ele
    end
    ls = cs if cs > ls
  end
  
  ls
end
#[2, 3, -6, 7, -6, 7]

# list = [-5, -1, -3]
