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
  {brand: "Audi", car_model: "RS Q3 Sportback",  version: "2.5 Tfsi Quattro 400 cv", year: 2021, color: "Gris", doors: 4, fuel_type: "oil", transmission: "AT", body_type: "SUV", miles: 8000, serial_number: "AUDI2021RSQ3", image_url: "https://imagenes.km77.com/fotos/bbtcontent/clippingnew/KM7KPH20221011_0001/full-original.jpg", displacement: 2500, horse_power: 400, torque: 480, acceleration: 4.5, autonomy: 600, airbags: 6, ABS: true, traction_control: true, capacity: 5, tank_capacity: 60, consumption: 8.5, leather_seats: true}, 
  {brand: "Chevrolet", car_model: "Onix",  version: "1.0 LT", year: 2021, color: "Blanco", doors: 5, fuel_type: "oil", transmission: "MT", body_type: "Hatchback", miles: 400, serial_number: "CHEVONIX2026", image_url: "https://fotos.perfil.com/2020/08/19/chevrolet-onix-rs-1003738.jpg", displacement: 1000, horse_power: 120, torque: 160, acceleration: 10.5, autonomy: 700, airbags: 4, ABS: true, traction_control: true, capacity: 5, tank_capacity: 45, consumption: 6.5, leather_seats: true}, 
  {brand: "Chevrolet", car_model: "Silverado",  version: "5.3 V8 Z71 Trail Boss", year: 2021, color: "Azul", doors: 4, fuel_type: "oil", transmission: "AT", body_type: "Pickup", miles: 10000, serial_number: "CHEVSILV2021", image_url: "https://cdn.motor1.com/images/mgl/jllNBk/s1/2022-chevrolet-silverado-zr2-review.jpg", displacement: 5300, horse_power: 360, torque: 500, acceleration: 6.5, autonomy: 650, airbags: 6, ABS: true, traction_control: true, capacity: 5, tank_capacity: 90, consumption: 12.0, leather_seats: true}, 
  {brand: "Chevrolet", car_model: "Tracker",  version: "1.2 Turbo AT", year: 2022, color: "Negro", doors: 5, fuel_type: "oil", transmission: "AT", body_type: "SUV", miles: 1, serial_number: "CHEVTRACK2026", image_url: "https://acnews.blob.core.windows.net/imgnews/paragraph/NPAZ_f0bc0c9b05964ee9aa66006f514aef65.webp", displacement: 1200, horse_power: 140, torque: 220, acceleration: 9.8, autonomy: 720, airbags: 6, ABS: true, traction_control: true, capacity: 5, tank_capacity: 50, consumption: 7.2, leather_seats: true}, 
  {brand: "Chevrolet", car_model: "Trailblazer",  version: "2.8 Td High Country 4X4 AT", year: 2021, color: "Gris", doors: 5, fuel_type: "gasoil", transmission: "AT", body_type: "SUV", miles: 0, serial_number: "CHEVTRAIL2021", image_url: "https://cdn.motor1.com/images/mgl/bgBOjk/s1/chevrolet-trailblazer.jpg", displacement: 2800, horse_power: 200, torque: 500, acceleration: 11.0, autonomy: 800, airbags: 6, ABS: true, traction_control: true, capacity: 7, tank_capacity: 76, consumption: 9.5, leather_seats: true}, 
  {brand: "Ford", car_model: "F-150 Raptor", version: "3.5L V6 Ecoboost Ho 4X4 AT", year: 2021, color: "Gris", doors: 4, fuel_type: "oil", transmission: "AT", body_type: "Pickup", miles: 11000, serial_number: "FORDF150R2021", image_url: "https://www.ford.com.ar/content/ford/ar/es_ar/home/crossovers-suvs-4x4/nueva-f-150-raptor/jcr:content/par/accordion/parsyses/item_1/splitter_1253152942/splitter0/image/image.imgs.480.high.jpg/1716480801059.jpg", displacement: 3500, horse_power: 456, torque: 510, acceleration: 5.5, autonomy: 750, airbags: 6, ABS: true, traction_control: true, capacity: 5, tank_capacity: 136, consumption: 14.0, leather_seats: true}, 
  {brand: "Jeep", car_model: "Compass", version: "1.3 T270 Limited", year: 2021, color: "Gris", doors: 5, fuel_type: "oil", transmission: "AT", body_type: "SUV", miles: 0, serial_number: "JEEPCOMP2021", image_url: "https://fotos.perfil.com/2021/04/28/trim/876/492/jeep-compass-1164952.jpg", displacement: 1300, horse_power: 175, torque: 250, acceleration: 9.5, autonomy: 680, airbags: 6, ABS: true, traction_control: true, capacity: 5, tank_capacity: 52, consumption: 7.8, leather_seats: true}, 
  {brand: "Kia", car_model: "Carnival", version: "2.2 Crdi Premium Avn", year: 2021, color: "Gris", doors: 5, fuel_type: "gasoil", transmission: "AT", body_type: "Monovolumen", miles: 0, serial_number: "KIACARN2021", image_url: "https://acnews.blob.core.windows.net/imgnews/medium/NAZ_02d3baa1e1f04f67a053eaf7d6696f61.webp", displacement: 2200, horse_power: 197, torque: 440, acceleration: 10.0, autonomy: 850, airbags: 6, ABS: true, traction_control: true, capacity: 7, tank_capacity: 80, consumption: 9.0, leather_seats: true}, 
  {brand: "Peugeot", car_model: "2008", version: "1.0T GT", year: 2021, color: "Blanco", doors: 5, fuel_type: "oil", transmission: "AT", body_type: "SUV", miles: 0, serial_number: "PEU20082021", image_url: "https://www.peugeot.com.ar/content/dam/peugeot/argentina/b2c/our-range/nuevo-2008/sitio/laion-y-ra/laion-ra-4mb.png?imwidth=768", displacement: 1000, horse_power: 120, torque: 180, acceleration: 11.0, autonomy: 700, airbags: 6, ABS: true, traction_control: true, capacity: 5, tank_capacity: 50, consumption: 6.8, leather_seats: true}, 
  {brand: "Ford", car_model: "Ranger Raptor", version: "3.0L V6 Ecoboost Biturbo Cabina Doble 4X4", year: 2021, color: "Naranja", doors: 4, fuel_type: "oil", transmission: "AT", body_type: "Pickup", miles: 28000, serial_number: "FORDRANGER2021", image_url: "https://cdn.motor1.com/images/mgl/nAZP2G/s3/img_4742.jpg", displacement: 3000, horse_power: 397, torque: 583, acceleration: 5.8, autonomy: 720, airbags: 6, ABS: true, traction_control: true, capacity: 5, tank_capacity: 82, consumption: 13.0, leather_seats: true}
]

cars.each do |attrs|
  Car.find_or_create_by!(serial_number: attrs[:serial_number]) do |car|
    car.assign_attributes(attrs)
  end
end

puts "Autos cargados en la base."
