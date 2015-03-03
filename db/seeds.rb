# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

c1 = Course.create(title: 'WDI')
c2 = Course.create(title: 'UXDI')
c3 = Course.create(title: 'PMI')

topic1 = Topic.create(
	title: "Projects",
	description: "Discussion board for project ideas and recruitment")

topic2 = Topic.create(
	title: "Jobs",
	description: "Search Jobs")

topic3 = Topic.create(
	title: "Meetups",
	description: "Find a Meetup")

topic4 = Topic.create(
	title: 'Founder Dating',
	description: 'Meet like-minded founders')