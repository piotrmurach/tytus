# Tytus <img src="http://upload.wikimedia.org/wikipedia/en/8/8f/Tytus_Harcerz.jpg" align="right" />

Helps you manage page titles in your Rails application.

In order to improve overall design of your app and increase findability of your pages in search ranks, Tytus gives you a declarative manner in which to title your pages.

## Installation

Add to your Gemfile and run the `bundle` command to install.

```ruby
gem "tytus"
```

## Usage

In your controllers:

```ruby
class ArticlesController < ApplicationController

  title 'A title for this particular controller'

end
```

and this title will be inherited by all actions within controller. However, if you need you can overwrite this on per action basis:

```ruby
class ArticlesController < ApplicationController

  title 'A title for this particular controller'

  def show
    title 'A title for this particular action'
  end
end
```

In your views:

```ruby
<%- title 'A title for this particular view' %>
```

and this will overwrite controller set titles.

## Development

Questions or problems? Please post them on the [issue tracker](https://github.com/peter-murach/tytus/issues). You can contribute changes by forking the project and submitting a pull request. You can ensure the tests are passing by running `bundle` and `rake`.

## Copyright

Copyright (c) 2011 Piotr Murach. See LICENSE for further details.
