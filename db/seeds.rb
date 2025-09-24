# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
# Este seed asegura que existan autos de ejemplo sin duplicar ni borrar registros existentes.
# Se puede ejecutar en cualquier entorno: production, development o test.
# db/seeds.rb
# Este seed asegura que existan autos de ejemplo sin duplicar ni borrar registros existentes.
# Se puede ejecutar en cualquier entorno: production, development o test.

cars = [
  { brand: "Audi", car_model: "RS Q3 Sportback", version: "2.5 Tfsi Quattro 400 cv", year: 2025, color: "Gris", doors: 4, fuel_type: "gasoline", transmission: "AT", body_type: "SUV", miles: 8000, serial_number: "AUDI2025RSQ3", image_url: nil },
  { brand: "Chevrolet", car_model: "Onix", version: "1.0 LT", year: 2026, color: "Blanco", doors: 5, fuel_type: "gasoline", transmission: "MT", body_type: "Hatchback", miles: 0, serial_number: "CHEVONIX2026", image_url: nil },
  { brand: "Chevrolet", car_model: "Silverado", version: "5.3 V8 Z71 Trail Boss", year: 2025, color: "Azul", doors: 4, fuel_type: "gasoline", transmission: "AT", body_type: "Pickup", miles: 10000, serial_number: "CHEVSILV2025", image_url: nil },
  { brand: "Chevrolet", car_model: "Tracker", version: "1.2 Turbo AT", year: 2026, color: "Negro", doors: 5, fuel_type: "gasoline", transmission: "AT", body_type: "SUV", miles: 0, serial_number: "CHEVTRACK2026", image_url: nil },
  { brand: "Chevrolet", car_model: "Trailblazer", version: "2.8 Td High Country 4X4 AT", year: 2025, color: "Gris", doors: 5, fuel_type: "diesel", transmission: "AT", body_type: "SUV", miles: 0, serial_number: "CHEVTRAIL2025", image_url: nil },
  { brand: "Ford", car_model: "F-150 Raptor", version: "3.5L V6 Ecoboost Ho 4X4 AT", year: 2025, color: "Gris", doors: 4, fuel_type: "gasoline", transmission: "AT", body_type: "Pickup", miles: 11000, serial_number: "FORDF150R2025", image_url: nil },
  { brand: "Jeep", car_model: "Compass", version: "1.3 T270 Limited", year: 2024, color: "Gris", doors: 5, fuel_type: "gasoline", transmission: "AT", body_type: "SUV", miles: 0, serial_number: "JEEPCOMP2024", image_url: nil },
  { brand: "Kia", car_model: "Carnival", version: "2.2 Crdi Premium Avn", year: 2024, color: "Gris", doors: 5, fuel_type: "diesel", transmission: "AT", body_type: "Monovolumen", miles: 0, serial_number: "KIACARN2024", image_url: nil },
  { brand: "Peugeot", car_model: "2008", version: "1.0T GT", year: 2025, color: "Blanco", doors: 5, fuel_type: "gasoline", transmission: "AT", body_type: "SUV", miles: 0, serial_number: "PEU20082025", image_url: nil },
  { brand: "Ford", car_model: "Ranger Raptor", version: "3.0L V6 Ecoboost Biturbo Cabina Doble 4X4", year: 2024, color: "Naranja", doors: 4, fuel_type: "gasoline", transmission: "AT", body_type: "Pickup", miles: 28000, serial_number: "FORDRANGER2024", image_url: nil }
]

cars.each do |attrs|
  Car.find_or_create_by!(serial_number: attrs[:serial_number]) do |car|
    car.assign_attributes(attrs)
  end
end

puts "Autos de ejemplo agregados o existentes confirmados."

