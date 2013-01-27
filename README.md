brgr
====

App for finding the nearest restaurant serving burgers

What it does
===========

1. Query Google Geocoding API for the list of geocodes for an address
2. Find the best geocode from the JSON
3. Query Google Places API for a list of restaurants with the geocode
4. Find the best restaurant from the JSON
5. Query Google Routes API for the directions from starting address to the restaurants location
6. Display result

todo
====

Add rules for finding the best restaurant and the best geocode for any given location

Add route search from start to destination
