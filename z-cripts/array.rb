# Definindo arrays
array1 = [1, 2, 3]
array2 = [6, 7, 8]

# Concatenação
puts (array1 + array2).inspect # [1, 2, 3, 6, 7, 8]

# Filter ( duas formas )
puts array1.select { |e| e < 3 }.inspect # [1, 2] 
puts array1.select do |it| 
  e < 3
end

# Find
puts array1.find { |e| e == 3 } # 3

# FindIndex
puts array1.index { |e| e == 3 } # 2

#Spread operator / merge
a = { nome: "Luis", idade: 30 }
b = a.merge({ teste: "Novo" }) # OR
b = { **a, teste: "Novo" }

# Flat
nested_array = [0, 1, [2, [3, [4, 5]]]]
puts nested_array.flatten.inspect # [0, 1, 2, 3, 4, 5]

# Includes
puts array1.include?(2) # true

# Pop
puts array1.pop # 3
puts array1.inspect # [1, 2]

# Unshift e Shift
array1.unshift(4, 5) # [4, 5, 1, 2]
puts array1.shift # 1

# Slice( index_inital, number of elements )
x = ['ant', 'bison', 'camel', 'duck', 'elephant'].slice(2, 2) # ['camel', 'duck']

# Sort
x = [40, 1, 5, 200].sort # [1, 5, 40, 200]
x = [40, 1, 5, 200].sort.reverse # [200, 40, 5, 1]
x = ['1994-05-10', '1999-12-28', '1989-08-15'].sort_by { |date| Date.parse(date) } # ["1989-08-15", "1994-05-10", "1999-12-28"]
sorted_people = people.sort_by { |person| person[:name] }

# Splice
array = ['Jan', 'Feb', 'March', 'April', 'June']
array[4, 1] = ['May']
puts array # ['Jan', 'Feb', 'March', 'April', 'May']

array = ['Jan', 'Feb', 'March', 'April', 'June']
array[4, 0] = ['May']
puts array # ['Jan', 'Feb', 'March', 'April', 'May', 'June']

