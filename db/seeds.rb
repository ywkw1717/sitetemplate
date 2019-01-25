# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

def insert_data
  (1..50).each do |num|
    Content.create!(
      name: 'テストだよ' + num.to_s,
      url: 'https://example.com/',
      playback: "７分４５秒",
      view: num,
      good: 10,
      comment: 2,
      post_time: "18/2/2"
    )
  end
end

insert_data if Rails.env.development?

csv_data = CSV.read('db/uniq_list.csv', headers: true)

csv_data.each do |data|
  Serif.create!(
    title: data['title'],
    filename: data['filename'],
    postnum: data['postnum'],
    source: data['source']
  )
end

AdminUser.create!(email: 'admin@example.com', password: 'passwordpassword', password_confirmation: 'password') if Rails.env.development?

AdminUser.create!(email: ENV['ADMIN_EMAIL_PRODUCTION'], password: ENV['ADMIN_PASSWORD_PRODUCTION'], password_confirmation: ENV['ADMIN_PASSWORD_PRODUCTION']) if Rails.env.production?
