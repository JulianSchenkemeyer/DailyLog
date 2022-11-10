# Daily Log

<div>
  <img src="/screenshots/mainscreen.png" height="500">
  <img src="/screenshots/addEntryScreen.png" height="500">
</div>


Daily Log is a simple app, enabling its users to document events affecting their mood through a simple emoji-based rating system along with a description. While the such an app could be quite useful for some people, the main purpose of Daily Log is to practice the use of different patterns and frameworks in a realistic environment.

## Features

- View your log entries for the entire month
- Add a new log entry for the current day
- Add multiple log entries for each day

## Planned

- [ ] Enable reviewing past months.
- [ ] Improve performance through moving the data fetching and saving actions to a background thread.
- [ ] Expand the core data model for log to also include timestamps, allowing the log entries for each day to be sorted.
- [ ] Improve the rating system with color coding, which could also be displayed directly in the list view.
- [ ] Add more tests
- [ ] Use local notifications to send reminders, if the user wants to have them.
- [ ] Add Quick actions to the notifications
- [ ] Add statistics view
- [ ] Add widgets quickly seeing the number of log entries for the current day
- [ ] Add a watch version of the app

## What technologies are used?

- **SwiftUI**: Used to quickly build and to interate the UI of the app.
- **Core Data**: Used as local database for storing the log entries and making them searchable.
