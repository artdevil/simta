# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 User.create(:id_key => "111128376", :username => "ana riana", :password => "tes123", :user_type => "student")
 User.create(:id_key => "111111111", :username => "burhanuddin dirgantara", :password => "tes123", :user_type => "lecture")
