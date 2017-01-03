# SassColorExtractor

This dirt simple Gem uses the Sass ruby library to read your `colors.scss` file and give you back
a list of color names and their actual colors which can be used to generate a nice color palette page in a
Rails app.

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

## Contributing

1. Fork it ( https://github.com/rcode5/sass_color_extractor/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
