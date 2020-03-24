# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Don't seed data for production environment just now!

include Rails.application.routes.url_helpers

if Rails.env.eql?("development")
  # users
  user_one = User.create(name: "ChilliBean Administrator", email: "admin@chillipharm.com", password: "Testingtest123", password_confirmation: "Testingtest123", chillibean_staff: true, activated: true, password_reset_date: DateTime.now)
  user_two = User.create(name: "Joe Bloggs", email: "joe@chillipharm.com", password: "Testingtest123", password_confirmation: "Testingtest123", chillibean_staff: false, activated: true, password_reset_date: DateTime.now)
  user_three = User.create(name: "Wanda Bloggs", email: "wanda@chillipharm.com", password: "Testingtest123", password_confirmation: "Testingtest123", chillibean_staff: false, activated: true, password_reset_date: DateTime.now)

  # Libraries
  first_library = Library.create(name: "A Populated Library", creator: user_one)
  second_library = Library.create(name: "Other Library", creator: user_one)

  # Asset 1
  video_asset_one = Asset.create(filename: "trial 106.mov", title: "Trial 106", filesize: 100.megabytes, file_type: Asset.file_types[:video], uploader: user_two, library: first_library, created_at: 2.weeks.ago)
end
