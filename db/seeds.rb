# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.new
u1.name = "Stephanie"
u1.lastname = "Alix"
u1.promo = 2018
u1.phone = "0123456789"
u1.email = "haha@gmail.fr"
u1.password = "01234678"
u1.save!

u2 = User.new
u2.name = "Charlélie"
u2.lastname = "Morineau"
u2.promo = 2018
u2.phone = "0123456789"
u2.email = "hihilol@gmail.fr"
u2.password = "012345678"
u2.save!

c1 = Club.new
c1.name = "Drinkiit"
c1.website = "ares-ensiie.eu"
c1.description = "On fait à manger tout les jours"
c1.save!

c2 = Club.new
c2.name = "BDS"
c2.website = "ares-ensiie1.eu"
c2.description = "On fait du sport tout les jours"
c2.save!

u1.add_club c1
u1.save!

a1 = Article.new
a1.title = "Barbecue"
a1.content = "Saucisse à 1€, boisson à 0.60€"
a1.is_private = false
a1.save!

a2 = Article.new
a2.title = "Barbecue_private"
a2.content = "Saucisse à 1€, boisson à 0.60€"
a2.is_private = true
a2.save!

a1.user_id=u1.id
a1.save!

a2.user_id=u2.id
a2.save!

Event.create(title: 'Apéro',location: 'ENSIIE STRASBOURG',date_start: '15-05-2016',date_end: '16-05-2016',is_private: false)

Event.create(title: 'Apéro_private',location: 'ENSIIE STRASBOURG',date_start: '15-05-2016',date_end: '16-05-2016',is_private: true)
