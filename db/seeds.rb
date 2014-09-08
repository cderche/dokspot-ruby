# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#user = CreateAdminService.new.call
#puts 'CREATED ADMIN USER: ' << user.email

languages = Language.create([
	{ name: 'Bulgarian' },
	{ name: 'Croatian' },
	{ name: 'Czech' },
	{ name: 'Danish' },
	{ name: 'Dutch' },
	{ name: 'English' },
	{ name: 'Estonian' },
	{ name: 'Finnish' },
	{ name: 'French' },
	{ name: 'German' },
	{ name: 'Greek' },
	{ name: 'Hungarian' },
	{ name: 'Irish' },
	{ name: 'Italian' },
	{ name: 'Latvian' },
	{ name: 'Lithuanian' },
	{ name: 'Maltese' },
	{ name: 'Polish' },
	{ name: 'Portuguese' },
	{ name: 'Romanian' },
	{ name: 'Slovak' },
	{ name: 'Slovene' },
	{ name: 'Spanish' },
	{ name: 'Swedish' },
	{ name: 'Chinese (Mandarin)' },
	{ name: 'Japanese' },
	{ name: 'Korean' },
	{ name: 'Russian' }
])