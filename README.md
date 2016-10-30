# Tytus
[![Gem Version](https://badge.fury.io/rb/tytus.svg)][gem]
[![Build Status](https://secure.travis-ci.org/piotrmurach/tytus.svg?branch=master)][travis]
[![Dependency Status](https://gemnasium.com/piotrmurach/tytus.svg?travis)][gemnasium]
[![Code Climate](https://codeclimate.com/github/piotrmurach/tytus/badges/gpa.svg)][codeclimate]
[![Coverage Status](https://coveralls.io/repos/github/piotrmurach/tytus/badge.svg)][coverage]
[![Inline docs](http://inch-ci.org/github/piotrmurach/tytus.svg?branch=master)][inchpages]

[gem]: http://badge.fury.io/rb/tytus
[gemnasium]: https://gemnasium.com/piotrmurach/tytus
[travis]: http://travis-ci.org/piotrmurach/tytus
[codeclimate]: https://codeclimate.com/github/piotrmurach/tytus
[coverage]: https://coveralls.io/github/piotrmurach/tytus
[inchpages]: http://inch-ci.org/github/piotrmurach/tytus

Helps you manage page titles in your Rails application.

Tytus gives you a declarative manner in which to title your pages in order to improve overall design of your app and to increase findability of your pages in search ranks.

## Installation

Add to your Gemfile:

```ruby
gem 'tytus'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tytus

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

Questions or problems? Please post them on the [issue tracker](https://github.com/piotrmurach/tytus/issues). You can contribute changes by forking the project and submitting a pull request. You can ensure the tests are passing by running `bundle` and `rake`.

## Copyright

Copyright (c) 2011-2016 Piotr Murach. See LICENSE for further details.
