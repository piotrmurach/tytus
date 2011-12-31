# Tytus <img src="http://upload.wikimedia.org/wikipedia/en/8/8f/Tytus_Harcerz.jpg" align="right" />
[![Build Status](https://secure.travis-ci.org/peter-murach/tytus.png?branch=master)][travis] [![Dependency Status](https://gemnasium.com/peter-murach/tytus.png?travis)][gemnasium]

[travis]: http://travis-ci.org/peter-murach/tytus
[gemnasium]: https://gemnasium.com/peter-murach/tytus

Helps you manage page titles in your Rails application.

Tytus gives you a declarative manner in which to title your pages in order to improve overall design of your app and to increase findability of your pages in search ranks.

## Installation

Add to your Gemfile and run the `bundle` command to install.

```ruby
gem 'tytus'
```

To configure your Rails 2.x application, in `config/environment.rb` add

```ruby
config.gem 'tytus'
```

## Usage

Update your locales file as in the following:

```
en:
  titles:
    site_name: Your site name goes here
```

In your controllers:

```ruby
class ArticlesController < ApplicationController

  title 'A title for this particular controller'

end
```

and this title will be inherited by all actions within controller. Alternatiely, `tytus` will look for controller specific titles in your locales file. You can add them yourself under `titles` key as in the following:

```ruby
en:
  titles:
    plural_controller_name: Your site name goes here
```

However, if you need you can overwrite controller specific title on per action basis:

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

or 

<h1><%= title 'A title for this particular view that renders also inside enclosed tag' %></h1>
```

and this will overwrite controller set titles.

Once you set your titles, in your layout call helper method `render_page_title`:

```html
<head>
  <title><%= render_page_title %></title>
</head>
```

By default `::` separator is used to change this pass `separator` hash parameter:

```html
<head>
  <title><%= render_page_title :separator => ' | ' %></title>
</head>
```

## Development

Questions or problems? Please post them on the [issue tracker](https://github.com/peter-murach/tytus/issues). You can contribute changes by forking the project and submitting a pull request. You can ensure the tests are passing by running `bundle` and `rake`.

## Copyright

Copyright (c) 2011 Piotr Murach. See LICENSE for further details.
