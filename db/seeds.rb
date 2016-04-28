# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Club.create(name: 'Drinkiit',website: 'ares-ensiie.eu',description: 'c est un club d alimentation')

Article.create(title: 'Barbecue',content: 'Saucisse à 1€, boisson à 0.60€',is_private: false)

Article.create(title: 'Barbecue_private',content: 'Saucisse à 1€, boisson à 0.60€',is_private: true)

Event.create(title: 'Apéro',location: 'ENSIIE STRASBOURG',date_start: '15-05-2016',date_end: '16-05-2016',is_private: false)

Event.create(title: 'Apéro_private',location: 'ENSIIE STRASBOURG',date_start: '15-05-2016',date_end: '16-05-2016',is_private: true)
