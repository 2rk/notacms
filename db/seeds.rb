# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Content.destroy_all

Menu.create(content: Content.create(title: 'Home', top: 100, left: 200, height: 200, width: 250, content: 'campJS Rocks!!') )
Menu.create(content: Content.create(title: 'About Us', top: 200, left: 300, height: 300, width: 200, content: 'Body of campJS 2') )
Menu.create(content: Content.create(title: 'Contact', top: 250, left: 500, height: 400, width: 300, content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu libero metus. Mauris tempor porttitor aliquam. Integer fermentum, libero ut sollicitudin tempus, lacus felis tristique ante, porttitor egestas neque ipsum in dui. Etiam condimentum mauris aliquet nunc imperdiet ullamcorper. Cras at dolor justo. Maecenas id sapien ut elit vulputate tempus ac id mauris. Vivamus ac magna blandit, tristique lectus quis, facilisis dui. In tempor rutrum adipiscing. Nulla tortor magna, sodales sit amet tellus sit amet, ullamcorper dictum neque. Curabitur blandit ipsum et augue viverra, eu elementum magna tincidunt. Fusce ut diam eu lorem eleifend pulvinar et et libero. Proin ac rhoncus lorem, eget rhoncus tortor. Sed quis feugiat velit, eu pretium lacus. Fusce volutpat, mi vel feugiat imperdiet, nibh lectus tempor libero, vitae malesuada odio sem eu eros. Duis vestibulum tempus imperdiet.') )
Menu.create(content: Content.create(title: 'Products', top: 350, left: 400, height: 450, width: 300, content: 'Body of campJS 4') )
Menu.create(content: Content.create(title: 'Our Staff', top: 200, left: 200, height: 250, width: 300, content: 'Body of campJS 5') )
