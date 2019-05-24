
require 'byebug'

# anagram?("gizmo", "sally")    #=> false
# anagram?("elvis", "lives")    #=> true


def first_anagram?(str1, str2)
  permu_arr = str1.split("").permutation.to_a
  permu_arr.map {|arr| arr.join("")}.include?(str2)
  
end

def second_anagram?(str1, str2)
  arr1 = str1.split("")
  arr2 = str2.split("")

  arr1.each do |ele|
    index = arr2.index(ele)
    arr2.delete(arr2[index]) unless index.nil?
  end
  arr2.empty?
end

def third_anagram?(str1, str2)
  alphabet = ('a'..'z').to_a
  
  sorted1 = false
  until sorted1
    sorted1 = true
    (0...str1.length - 1).each do |i|
      if alphabet.index(str1[i]) > alphabet.index(str1[ i + 1])
        str1[i], str1[i + 1] = str1[i + 1], str1[i]
        sorted1 = false
      end
    end
  end

  sorted2 = false
  until sorted2
    sorted2 = true
    (0...str2.length - 1).each do |i|
      if alphabet.index(str2[i]) > alphabet.index(str2[ i + 1])
        str2[i], str2[i + 1] = str2[i + 1], str2[i]
        sorted2 = false
      end
    end
  end

  str1 == str2
end


def fourth_anagram?(str1, str2)
  hash = Hash.new(0)

  str1.each_char {|char| hash[char]+= 1}
  str2.each_char {|char| hash[char]-= 1 }
  hash.all? {|k,v| v == 0} 
end