# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  map = L.map("map").setView([47.601468 ,-122.330189], 13)

  googleLayer = new L.Google("ROADMAP")
  map.addLayer googleLayer

  marker = L.marker([51.5, -0.09]).addTo(map)
