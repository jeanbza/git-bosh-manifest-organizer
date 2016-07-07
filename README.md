# Bosh::Manifest::Organizer

[![Build Status](https://travis-ci.org/jadekler/git-bosh-manifest-organizer.svg?branch=master)](https://travis-ci.org/jadekler/git-bosh-manifest-organizer)

Reorganize your bosh manifests!

## Installation

`gem install bosh-manifest-organizer`

## Usage

CLI:

`bosh download manifest some-deployment | bosh-manifest-organizer`

Library:

1. Add `gem 'bosh-manifest-organizer'` to your `Gemfile`
1. `bundle install`
1. In code:

    ```
    require 'bosh-manifest-organizer'
    
    Bosh::Manifest::Organizer.organize_yml('foo: 5')
    ```


## Development

Building:

1. `gem build bosh-manifest-organizer.gemspec`
1. `gem install bosh-manifest-organizer-0.1.0.gem`
1. `echo "foo: 5" | bosh-manifest-organizer`

Testing:

1. `rspec`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/bosh-manifest-organizer.
