# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!([{ username: 'admin@admin.com', password: 'administrator' }])

Area.create([{ areaname: 'SampleArea1' }, { areaname: 'SampleArea2' }, { areaname: 'SampleArea3' }, { areaname: 'SampleArea4' }, { areaname: 'SampleArea5' }, { areaname: 'SampleArea6' }, { areaname: 'SampleArea7' }, { areaname: 'SampleArea8' }, { areaname: 'SampleArea9' }, { areaname: 'SampleArea10' }])

Complaint.create!([

{ name: 'Someone', email: 'someone@something.com', subject: 'This is a subject.', description: 'this is a very very very very long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long long complaint description', created_at: DateTime.strptime("09/14/2009 8:00", "%m/%d/%Y %H:%M"), read: false, areaname: 'SampleArea7' }
])
