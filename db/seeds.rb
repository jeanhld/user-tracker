# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(1..12).each do |i|
  visitor=Visitor.create(identifier: "#{i}-uid")
  Contact.create(visitor: visitor, email: "mail#{i}@mail.com")
  (0..3).each do |j|
    visited_page = VisitedPage.create(visitor: visitor, page: j, accessed_at: DateTime.now-j.days)
  end
end
