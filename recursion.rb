puts 'recursion.rb file loaded'

####### MERGE SORT ########

messy_array = [500, 13, 20, 69, 3, 1, 0, 101, 35]

def merge_sort(messy_array) # method definition
  messy_length = messy_array.length
  if messy_length < 2 # BASE CASE, a single item array
    messy_array # Just want the value back since it's "sorted"!
  elsif messy_length > 1 # no base case, divde array in half
    mid_ind = messy_length / 2 # middle index of end of first sub array
    # Make 2 empty sub arrays of more or less equal length:
    sub_array_a = Array.new(mid_ind)
    sub_array_b = Array.new(messy_length - mid_ind)
    # fill sub_array_a:
    for i in 0..(mid_ind - 1) do
      sub_array_a[i] = messy_array[i]
    end
    # Fill sub_array_b:
    for i in mid_ind..(messy_length - 1) do
      sub_array_b[i - mid_ind] = messy_array[i]
    end
    # ^ 2 new unsorted arrays, recursively call the same method on it!
    merge_sort(sub_array_a)
    merge_sort(sub_array_b)
    # Start merging (conquering)
    a_length = sub_array_a.length
    b_length = sub_array_b.length
    sorted_array = [] # create array to sort into
    i_a = 0 # pointer for sub_array_a
    i_b = 0 # pointer for sub_array_b
    i_s = 0 # pointer for sorted_array/ messy_array
    # Both arrays are not yet empty, keep comparing:
    while i_a < a_length && i_b < b_length # both pointers have not reached end of array
      if sub_array_a[i_a] <= sub_array_b[i_b]
        messy_array[i_s] = sub_array_a[i_a]
        i_a += 1 # increment to use next item in sub_array_a
      else
        messy_array[i_s] = sub_array_b[i_b]
        i_b += 1 # increment to use next item in sub_array_b
      end
      i_s += 1 # increment messy_array pointer regardless
    end
    # Code below runs when 1 array is empty, add the reminaing ("cleanup"):
    while i_a < a_length # There's still some left in sub_array_a
      messy_array[i_s] = sub_array_a[i_a]
      i_a += 1
      i_s += 1
    end
    while i_b < b_length # There's still some left in sub_array_b
      messy_array[i_s] = sub_array_b[i_b]
      sorted_array[i_s] = sub_array_b[i_b] # test double
      i_b += 1
      i_s += 1
    end
    messy_array
  else
    puts 'some very strange error'
  end
end

######## FIBONACCI ########

# Iterative method
def fibs(number)
  fibs_array = []
  for i in 0...number do # 3 dots excludes last num (for index)
    if i == 0
      fibs_array[i] = 0
    elsif i == 1
      fibs_array[i] = 1
    else # do the math
      fibs_array[i] = fibs_array[i - 2] + fibs_array[i - 1]
    end
  end
  fibs_array
end

# Recursive method. Calling itself until base case
def fibs_rec(num)
  if num <= 2 # BASE CASE
    rec_fib_array = [0, 1] 
  else
    rec_fib_array = fibs_rec(num - 1)
    rec_fib_array << rec_fib_array[-2] + rec_fib_array[-1] # Pushes object onto end
  end
  rec_fib_array
end

puts "fibs is #{fibs(8)}"
puts "fibs_rec is #{fibs_rec(8)}"
puts "merge_sort result is: #{merge_sort(messy_array)}" # method invocation
