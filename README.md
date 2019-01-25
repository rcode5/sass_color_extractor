# SassColorExtractor - DEPRECATED - DO NOT USE

With Ruby Sass being deprecated and unmaintained as of March 26 2019, this gem will no longer be something
you should depend on.

As a replacement, you could try building custom color classes using Sass with something like the following.

Add to your colors file a map of all colors.

```scss
/* My Colors File */
$black: #000;
$white: #ffffff;
$light_gray: darken($white, 20%);
$dark_gray: lighten($black, 20%);

/** Map of colors **/
$all_colors: (
  "black": $black,
  "white": $white,
  "light_gray": $light_gray,
  "dark_gray": $dark_gray
);
```

Then you can generate classes for your palette with something like
```scss

```
@each $name, $color in $all_colors {
  .palette-colors__color--#{$name} {
    background-color: #{$color};
  }
}
```

And in your view you'll need to add a duplicate list of these colors with something like

```slim
# app/views/palettes/show.html.slim
ruby:
  colors = %w( black white light_gray dark_gray )

.palette-colors
  - colors.each do |color|
    .palette-colors__color class="palette-colors__color--#{color}"
      .palette-colors__color-info
        .palette-colors__color-info__name = color
```

This will no longer show the value, though I'm sure you could figure that out with some more
SCSS interpolation.

For more reading: [Ruby Sass is Deprecated](http://sass.logdown.com/posts/7081811)

---------------

# SassColorExtractor

This dirt simple Gem uses the Sass ruby library to read your `colors.scss` file and give you back
a list of color names and their actual colors which can be used to generate a nice color palette page in a
Rails app.

If you are using Bootstrap and overriding Bootstrap colors, this Gem will probably not work for you.  It requires that all color definitions are made in a single file.  Perhaps in the future it will follow `@import`s.

[![Gem Version](https://badge.fury.io/rb/sass-color-extractor.png)](http://badge.fury.io/rb/sass_color_extractor)
[![Build Status](https://circleci.com/gh/rcode5/sass_color_extractor.svg?style=shield&circle-token=485f42e03b961bb2ac17e9ee814fe963bd58954c)]()

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sass-color-extractor'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sass-color-extractor

## Usage

### Basic Usage
You should extract your color variables into their own file (which you would then `@import` as necessary
in your scss/sass files.  Once you have that, you can get a map of color names to their hex color like so:


```

scss_file = "/path/to/my/colors.scss"
pp SassColorExtractor.parse_colors(scss_file)

```

For a more concrete example, given this `colors.scss` file

```
/* My Colors File */
$black: #000;
$white: #ffffff;
$light_gray: darken($white, 20%);
$dark_gray: lighten($black, 20%);
```

You'd get a hash in ruby like this:
```
{
  "black"=>"000",
  "white"=>"ffffff",
  "light_gray"=>"cccccc",
  "dark_gray"=>"333333"
}
```

### Add Palette page to a Rails app

To add a page in your Rails app that shows all the colors defined in the palette with their corresponding hex value,
add a route, controller and view:

```
# config/routes.rb

MyApp::Application.routes.draw do
  ...
  resource :palette, only: [:show]
end
```

```
# app/controllers/palettes_controller.rb
class PalettesController < ApplicationController
  def show
    f = File.expand_path('app/assets/stylesheets/_colors.scss')
    @colors = SassColorExtractor::Base.parse_colors(f)
  end
end
```

```
# app/views/palettes/show.html.slim
.palette-colors
  - @colors.each do |name, hexval|
    .palette-colors__color(style="background-color: ##{hexval}")
      .palette-colors__color-info
        .palette-colors__color-info__name = name
        .palette-colors__color-info__hexval = "##{hexval}"
```

With a little CSS:
```
// app/assets/stylesheets/palette.scss
.palette-colors {
  display: flex;
  flex-flow: row wrap;
  justify-content: center;
}
.palette-colors__color {
  border-radius: 4px;
  border: 1px solid #ddd;
  margin: 7px;
  width: 120px;
  height: 120px;
  position: relative;
}
.palette-colors__color-info {
  position: absolute;
  bottom: 0px;
  width: 100%;
  padding: 4px;
  text-align:center;
  background-color: rgba(200,200,200,0.7);
  font-size: 0.8rem;
  border-radius: 4px;
  color: #000;
}
```

You should get a nice little palette.




## Contributing

1. Fork it ( https://github.com/rcode5/sass_color_extractor/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
