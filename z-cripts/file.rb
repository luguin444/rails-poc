require 'json'

# Lendo o arquivo JSON
file_content = File.read('z-cripts/file.json')
people = JSON.parse(file_content)

# Adicionando um novo objeto ao array e escrevendo no novo arquivo JSON
updated_people = people.push({ id: 3, name: "teste4"})

File.write('z-cripts/file.json', JSON.pretty_generate(updated_people))