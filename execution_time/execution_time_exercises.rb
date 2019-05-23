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
 