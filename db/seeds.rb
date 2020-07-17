# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

park_1 = Park.create(name: "Six Flags", admission_price: 40)
park_2 = Park.create(name: "Disney", admission_price: 110)
ride_1 = park_1.rides.create(name: "Tower of Doom", thrill_rating: 10)
ride_2 = park_1.rides.create(name: "Mind Eraser", thrill_rating: 9)
ride_3 = park_1.rides.create(name: "Splash Mountain", thrill_rating: 7)
ride_4 = park_2.rides.create(name: "Space Mountain", thrill_rating: 3)
mechanic_1 = Mechanic.create(name: "Kathy", years_of_experience: 2)
mechanic_2 = Mechanic.create(name: "Justin", years_of_experience: 8)
mechanic_3 = Mechanic.create(name: "Eric", years_of_experience: 4)
RideMechanic.create(ride: ride_1, mechanic: mechanic_1)
RideMechanic.create(ride: ride_1, mechanic: mechanic_2)
RideMechanic.create(ride: ride_2, mechanic: mechanic_2)
RideMechanic.create(ride: ride_2, mechanic: mechanic_3)
RideMechanic.create(ride: ride_3, mechanic: mechanic_1)
RideMechanic.create(ride: ride_3, mechanic: mechanic_3)
