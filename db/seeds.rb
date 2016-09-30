# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
#puts 'CREATED ADMIN USER: ' << user.email

languages = Language.create([
	{ name:	'English - Europe'	,	local:	'English - Europe'	},
	{ name: 'English - USA'			,	local:	'English - USA'			},
	{ name: 'French'						,	local:	'Français'					},
	{ name: 'German'						,	local:	'Deutsch'						},
	{ name: 'Russian'						,	local:	'Русский'						}
])

companies = Company.create([
	{
		name:					'dokspot GmbH'								,
		symbol:				'DKS'													,
		website:			'https://www.dokspot.com'			,
		contact:			'cyrille.derche@dokspot.com'	,
		order_email:	'cyrille.derche@dokspot.com'
	}
])

users =	User.create([
	{
		email:									'cyrille.derche@dokspot.com'	,
		company:								Company.first()								,
		password:								'password'										,
		password_confirmation:	'password'										,
		role:										:admin
	}
])
