require "json"
require "rest-client"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# json = RestClient.get "http://www.omdbapi.com/?apikey=[97689314]&" "https://omdbapi.com/?t=#{Faker::Movie.title}&apikey=97689314"
# movie_info = JSON.parse(json)
puts "Cleaning database..."
Bookmark.destroy_all
Movie.destroy_all


json = RestClient.get "http://tmdb.lewagon.com/movie/top_rated"
movie_info = JSON.parse(json)["results"]
  movie_info.each do |info|
    Movie.create(
    title: info["title"],
    overview: info["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500#{info["poster_path"]}",
    rating:  info["vote_average"]
  )
  end
puts "Finished!"
