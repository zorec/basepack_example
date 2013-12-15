# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
projects = []
projects << Project.create(name: "Project A", start: Date.today, :end => Date.today + 3.months)
projects << Project.create(name: "Project B", start: Date.today + 2.months, :end => Date.today + 5.months)

Version.create(name: "1.0", project_id: projects.first.id)
Version.create(name: "1.1", project_id: projects.first.id)

Version.create(name: "1.0", project_id: projects[1].id)
Version.create(name: "2.0", project_id: projects[1].id)


# Issue.create(name: "Issue 1", project_id: projects.first.id)
# Issue.create(name: "Issue 2", project_id: projects.first.id)
# Issue.create(name: "Issue 3", project_id: projects.first.id)

 