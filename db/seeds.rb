# First create at least 2 users after run this seed

puts "Cadastrando as provincias..."
Province.find_or_create_by!(province_name: "Luanda")
Province.find_or_create_by!(province_name: "Úige")
Province.find_or_create_by!(province_name: "Uila")
Province.find_or_create_by!(province_name: "Kuanza Sul")
puts "Fim do cadastro de provincias."

puts "Cadastrando municipios/cidade..."
City.find_or_create_by!(city_name: "Belas", province: Province.first)
City.find_or_create_by!(city_name: "Gabela", province: Province.last)
City.find_or_create_by!(city_name: "Sumbe", province: Province.last)
City.find_or_create_by!(city_name: "Viana", province: Province.first)
puts "Fim do cadastro das municipios/cidade."


puts "Cadastrando as cidades...."
Address.find_or_create_by!(street: "Centralidade do Kilamba", city: City.all.sample)
Address.find_or_create_by!(street: "Rangel rua 17", city: City.all.sample)
Address.find_or_create_by!(street: "Talalice", city: City.all.sample)
Address.find_or_create_by!(street: "Mutamba", city: City.all.sample)
puts "Fim do cadastro das cidades."

puts "Cadastrando usuarios...."
user = User.new 
user.email = "ucan11@gmail.com"
user.password = "12345678"
user.password_confirmation = "12345678"
user.save!

user = User.new
user.email = "ucan22@outlook.com"
user.password = "12345678"
user.password_confirmation = "12345678"
user.save!
puts "Fim do cadastro de usuários."

puts "Cadastrando as perfis...."
Profile.find_or_create_by!(
    name_profile: "Utanga", 
    phone1: "944889722",
    phone2: "666666666",
    profile_type: "ESTUDANTE",
    gender: "MASCULINO",
    address: Address.all.sample,
    user: User.last
)
Profile.find_or_create_by!(
    name_profile: "Catolica", 
    phone1: "942222222",
    phone2: "994444444",
    profile_type: "FUNCIONARIO",
    gender: "MASCULINO",
    address: Address.all.sample,
    user:User.first 
)
puts "Fim do cadastro de perfis."
