# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  map = L.map("map").setView([47.601468 ,-122.330189], 13)

  googleLayer = new L.Google("ROADMAP")
  map.addLayer googleLayer

  marker = L.marker([51.5, -0.09]).addTo(map)
  marker = L.marker([47.608413 , -122.361088]).addTo(map)
  marker = L.marker([47.598213 , -122.348557]).addTo(map)
  marker = L.marker([47.606778 , -122.377396]).addTo(map)
