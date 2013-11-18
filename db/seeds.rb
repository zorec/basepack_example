# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

project = Project.create(name: "Project A")


Issue.create(name: "Issue 1", project_id: project.id)
Issue.create(name: "Issue 2", project_id: project.id)
Issue.create(name: "Issue 3", project_id: project.id)

 