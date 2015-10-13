# thermodo.com

<img src="https://travis-ci.org/robocat/thermodo.com.svg" data-bindattr-812="812" title="Build Status Images">
[![David](https://img.shields.io/david/strongloop/express.svg)]()

The tiny thermometer for your mobile device that lets you measure the temperature, right where you are.

## Requirements

You need to have [Ruby](http://ruby-lang.org) and [npm](https://www.npmjs.com/) installed your machine. For OS X users it is recommended to install these tools through [Homebrew](http://brew.sh/). To install these run:

```
brew update && brew install ruby npm
```

## Getting started

Building the website is facilitated by [Gulp](http://gulpjs.com) which is configured through the [gulpfile](gulpfile.coffee). To install all dependencies for both ruby and node run

```
make install
```

This will also make a link to the pow server such that you can visit ``thermodo.com.dev/`` in your browser.

To continously build the site while watching for changes run

```
make watch
```

To build a production ready release build of the website run

```
make release
```

## Deployments

Deployments can only be performed by core contributers of the project and are automated with the ``s3_website`` gem with the ``make deploy`` command. Core contributors will have to create a ``.env`` file and fill in the missing S3 keys.

## Contributing

1. Clone the repository
2. Create a new branch for your contribution
3. Make the changes
4. Check that the website builds correcly by running ``make release`` and check that everything looks correct
5. Make a pull request where you clearly state what you contribution constitutes
