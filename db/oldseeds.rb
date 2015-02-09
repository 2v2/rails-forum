# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

alex = User.create(
	screen_name: "tushtickler",
	password: "blah")
david = User.create(
	screen_name: "dead1020",
	password: "pw123")

topic1 = Topic.create(
	title: "Projects",
	description: "Discussion board for project ideas and recruitment")

topic2 = Topic.create(
	title: "Resources",
	description: "Various links and handy resources")

entry1 = Entry.create(
	title: "rails forum for GA",
	user_id: david.id,
	topic_id: topic1.id,
	comment_num: 1,
	content: "Need a competent developer for pair programming who will not hold me back - MUST LOVE CATS")

Comment.create(
	user_id: alex.id,
	entry_id: entry1.id,
	content: "FUCK YOUR CATS")