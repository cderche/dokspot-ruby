# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# user = CreateAdminService.new.call
# puts 'CREATED ADMIN USER: ' << user.email
# puts 'CREATED ADMIN PASSWORD: ' << user.email

User.create!(email: ENV['ADMIN_EMAIL'], password: ENV['ADMIN_PASSWORD'], password_confirmation: ENV['ADMIN_PASSWORD'], confirmed_at: Time.now, role: :admin)

languages = Language.create([
	{ name:	'English - Europe'	,	local:	'English - Europe'	},
	{ name: 'English - USA'			,	local:	'English - USA'			},
	{ name: 'French'						,	local:	'Français'					},
	{ name: 'German'						,	local:	'Deutsch'						},
	{ name: 'Russian'						,	local:	'Русский'						},
])

companies = Company.create([
	{
		name:					'dokspot GmbH'						,
		symbol:				'DKS'											,
		website:			'https://www.dokspot.com'	,
		contact:			ENV['ADMIN_EMAIL']				,
		order_email:	ENV['ADMIN_EMAIL']				,
	}
])
