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
c1.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nec lacus eu nulla tempor vestibulum. Vestibulum id diam tincidunt, ultricies nisi eget, congue risus. Sed hendrerit mauris in leo faucibus, quis congue nisl tempor. Quisque orci quam, tristique in augue vel, sollicitudin ultricies metus. Vivamus at mauris rhoncus, auctor est at, dapibus augue. Phasellus eu sapien tempus, dapibus nibh a, placerat dui. Interdum et malesuada fames ac ante ipsum primis in faucibus. Proin quis lacus ante.

Duis maximus maximus convallis. Aenean metus augue, venenatis hendrerit efficitur eu, volutpat vel lacus. Mauris suscipit lorem quis mi hendrerit viverra. Vestibulum sem ipsum, viverra sed facilisis eget, bibendum sit amet ligula. Suspendisse potenti. Vivamus accumsan, purus non lacinia feugiat, nisl augue gravida est, in ultrices orci odio a elit. Suspendisse at tortor molestie, aliquam nisi sit amet, feugiat quam."
c1.president = "Nicolas"
c1.save!

c2 = Club.new
c2.name = "BDS"
c2.website = "ares-ensiie1.eu"
c2.description = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nec lacus eu nulla tempor vestibulum. Vestibulum id diam tincidunt, ultricies nisi eget, congue risus. Sed hendrerit mauris in leo faucibus, quis congue nisl tempor. Quisque orci quam, tristique in augue vel, sollicitudin ultricies metus. Vivamus at mauris rhoncus, auctor est at, dapibus augue. Phasellus eu sapien tempus, dapibus nibh a, placerat dui. Interdum et malesuada fames ac ante ipsum primis in faucibus. Proin quis lacus ante.

Duis maximus maximus convallis. Aenean metus augue, venenatis hendrerit efficitur eu, volutpat vel lacus. Mauris suscipit lorem quis mi hendrerit viverra. Vestibulum sem ipsum, viverra sed facilisis eget, bibendum sit amet ligula. Suspendisse potenti. Vivamus accumsan, purus non lacinia feugiat, nisl augue gravida est, in ultrices orci odio a elit. Suspendisse at tortor molestie, aliquam nisi sit amet, feugiat quam."
c2.save!

i1=Inscription.new
i1.club_id = c1.id
i1.user_id = u1.id
i1.valide = true
i1.admin = true
i1.save!

i2=Inscription.new
i2.club_id = c1.id
i2.user_id = u2.id
i2.valide = true
i2.admin = false
i2.save!



a1 = Article.new
a1.title = "Barbecue"
a1.content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nec lacus eu nulla tempor vestibulum. Vestibulum id diam tincidunt, ultricies nisi eget, congue risus. Sed hendrerit mauris in leo faucibus, quis congue nisl tempor. Quisque orci quam, tristique in augue vel, sollicitudin ultricies metus. Vivamus at mauris rhoncus, auctor est at, dapibus augue. Phasellus eu sapien tempus, dapibus nibh a, placerat dui. Interdum et malesuada fames ac ante ipsum primis in faucibus. Proin quis lacus ante.

Duis maximus maximus convallis. Aenean metus augue, venenatis hendrerit efficitur eu, volutpat vel lacus. Mauris suscipit lorem quis mi hendrerit viverra. Vestibulum sem ipsum, viverra sed facilisis eget, bibendum sit amet ligula. Suspendisse potenti. Vivamus accumsan, purus non lacinia feugiat, nisl augue gravida est, in ultrices orci odio a elit. Suspendisse at tortor molestie, aliquam nisi sit amet, feugiat quam."
a1.is_private = false
a1.club = c1
a1.save!

a2 = Article.new
a2.title = "Barbecue_private"
a2.content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam nec lacus eu nulla tempor vestibulum. Vestibulum id diam tincidunt, ultricies nisi eget, congue risus. Sed hendrerit mauris in leo faucibus, quis congue nisl tempor. Quisque orci quam, tristique in augue vel, sollicitudin ultricies metus. Vivamus at mauris rhoncus, auctor est at, dapibus augue. Phasellus eu sapien tempus, dapibus nibh a, placerat dui. Interdum et malesuada fames ac ante ipsum primis in faucibus. Proin quis lacus ante.

Duis maximus maximus convallis. Aenean metus augue, venenatis hendrerit efficitur eu, volutpat vel lacus. Mauris suscipit lorem quis mi hendrerit viverra. Vestibulum sem ipsum, viverra sed facilisis eget, bibendum sit amet ligula. Suspendisse potenti. Vivamus accumsan, purus non lacinia feugiat, nisl augue gravida est, in ultrices orci odio a elit. Suspendisse at tortor molestie, aliquam nisi sit amet, feugiat quam."
a2.is_private = true
a2.club = c2
a2.save!

a1.user_id=u1.id
a1.save!

a2.user_id=u2.id
a2.save!

Event.create(title: 'Apéro',location: 'ENSIIE STRASBOURG',date_start: '15-05-2016',date_end: '16-05-2016',is_private: false)

Event.create(title: 'Apéro_private',location: 'ENSIIE STRASBOURG',date_start: '15-05-2016',date_end: '16-05-2016',is_private: true)
