## Introduction

This is a single API built using Rails by following TDD.

## Examples

Below, there is a simple example of a method from the API, which returns a list of books
in a JSON format.

```ruby
def index
  books = Book.all
  if rating = params[:rating]
    books = books.where(rating: rating)
  end
  render json: books, status: 200
end
```

## Installation

In the main directory of the project, run the command `bundle` to install the gems from the Gemfile.

## Tests

This is a example of integration test of the application:

```ruby
test 'listing books' do
  get '/books'
  assert_equal 200, response.status
  assert_equal Mime::JSON, response.content_type

  books = json(response.body)[:books]
  assert_equal Book.count, books.size
  book = Book.find(books.first[:id])
  assert_equal @scifi.id, book.genre.id
end
```

This test is going to do a http get request to the `/book` route, accessing the `BooksController` and `Index` action. Then, it is going to check all assertions. All assertions being true, the test passes.

### Run tests

You can run the tests by using the command line `rake`. This runs all integration tests.

You can see more about other ways to run a specific test in this link http://guides.rubyonrails.org/v4.0.4/testing.html


## Contributing  

* Fork the project on github: https://github.com/charlesoft/ReadingList_RailsAPI

* Make your changes by writing tests

* Commit the changes without making changes to the Rakefile, VERSION, or any other files that aren’t related to your enhancement or fix

* Send a pull request
