# each pair e has_key?
files.each_pair do |key, value| 
    
  if owners.has_key?(key) 
    owners[value].push(file_name)
  else
    owners[value] = [file_name]
  end
end

hash = { a: 1, b: 2, c: 3 }

# EACH KEY
hash.each_key do |key|
  puts "Chave: #{key}"
  # Aqui você pode acessar os valores correspondentes se necessário:
  puts "Valor: #{hash[key]}"
end

object = { 1 => true, 2 => 'teste', 3 => 'ahahah', 4 => [1, 2, 34] }

# Obtendo chaves
x =  object.keys # [1, 2, 3, 4]

# Obtendo valores
x =  object.values # [true, "teste", "ahahah", [1, 2, 34]]

# Obtendo entradas (pares chave-valor)
x =  object.to_a
# [[1, true], [2, "teste"], [3, "ahahah"], [4, [1, 2, 34]]]
