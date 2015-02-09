# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

topic1 = Topic.create(
	title: "Projects",
	description: "Discussion board for project ideas and recruitment")

topic2 = Topic.create(
	title: "Resources",
	description: "Various links and handy resources")

topic3 = Topic.create(
	title: "Princess Peach",
	description: "Web Development Immersive - fall 2014")
