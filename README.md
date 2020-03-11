# Chillipharm Basic

Welcome to the Chillibean Tech test.

## Setup

Recommended Ruby version 2.6.3

Ensure PostgreSQL is set up and running on your system.

Install gems.

`bundle install`

Create a `chillipharmbasic` role in PostgreSQL.

```
createuser -s -r chillipharmbasic
```

Set up the database and seed data.

`rake db:setup`

Running the application at http://localhost:3000

`rails s`

## Running Test Suite

Run all tests:

`rspec`

## Background

Chillipharm is a system for storing media files (videos, images etc.), known collectively as "Assets".  Assets can be grouped within a Library.  Assets can also have Comments associated with them.

## Tasks

1. Library Searching: At the top left of the Library index page is a Search bar.
Make any necessary adjustments so that a user can type some input, hit "Search" and have the page display Assets whose title partially or entirely matches the search string (non case-sensitive).
Only assets associated with the Library should be returned.

2. Library Asset Sorting & Filtering: Below the Search bar is an option to see a "List View".
Clicking that link displays the Assets underneath a bar with options to "Filter By" and "Sort By".
Make any necessary adjustments so that the Filter By and Sort By dropdowns work as they should on the displayed assets.
Both dropdowns should be able to work in conjunction with each other as well as on a list of assets returned from a search.

3. Storing Searches:
Users would like a way to save searches and their results for reviewing later.  A Search should have a name.  Saved Searches should be listed somewhere within the Library.  Users should be able to delete a Search.

## Expected Timeframe:

The task should take about 2 and a half to 3 hours.  If you're spending longer than that, stop. Getting all the way through the task is less important than evidence of good working process and software development.

## Do:

- Write some tests
- Document or comment anything appropriate

## Don't:

- Spend too much time on formatting or styling, this is an engineering challenge not a graphic design test

## Submission

Fork this repository and publish it to your personal Github account.  Then submit your solution as a pull request to the Master branch.
