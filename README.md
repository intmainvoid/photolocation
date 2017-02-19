# Photo Location

A social photography app to keep track of scenic locations.

The UI is pretty much self-explanatory, but far from perfect, so here are a few notes to smooth the adoption of the UI:

- On the locations' list view, locations are sorted by distance - smallest to largest - from the user’s current location. If the user’s location is not available, the list will not be sorted. The list is only sorted when displayed. ie. The list will not be dynamically resorted if the user’s location changes while the list is displayed.

- The MapView’s zoom will always be set to fit all the locations on the screen whenever the map view is displayed on the screen.

- To add a new location the user needs to tap and hold on the map where the new location is to be added.

- To remove a location, the user needs to open the location in the detail view and tap on the delete button

- The list of the locations displays only the name of each location. To see more details about that location the user should tap on it to open the detail view

Built with Xcode 8.2.1, Swift version 3.0.2
