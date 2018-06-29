# Nasa Image API Search

Hosted on Heroku: [https://powerful-ocean-19109.herokuapp.com/](https://powerful-ocean-19109.herokuapp.com/)

Tracks Searches to the Nasa Images API.

* Records a count of each unique search term
* Provides filtering of search history by date, and count, and alphabetical.
* Clicking on a search in the sidebar searches it again

* Viewing a search result will show times it was previously searched.
* Returns and displays JSON currently, but in the future, this could be wrapped
  and parsed to display the different media types the API supports with more time.

* Pagination was _not_ considered at this time, but will need to be addressed in the future.

## Setup

* Install Ruby 2.5.1

* Run:

  ```bash
  bundle install
  rails db:create && rails db:migrate
  rails server
  ```

## Running Tests

You can run our small suite of tests with

```bash
rails test
```

Currently we don't have VCR or another library to help with API requests, but in the future, this can easily be added.

## Some Info

Uses a service class in `app/services/nasa_images.rb` to use HTTParty to get the
response back from NASA's api.

Search is done via the SearchesController, we have some _weirdness_ with the fact
the index and create methods are duplicated, but this was done to handle some other
cases, where I wanted to return results and still log the search without making the
links be a different type of method than GET.

**SearchTerm currently has no database constraints for uniqueness for query.**
This is currently handled via a model validation.
