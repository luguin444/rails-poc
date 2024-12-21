i =0

while i <= 10
  if i == 5
    i += 1
    next
  end

  # Print the current value of i
  puts i

  # Use break to exit the loop early
  break if i == 8

  # Increment i
  i += 1
end