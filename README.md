# CTmatch4CC Documentation

Slate-based documentation site for the [CTmatch4CC Initiative](http://www.ci4cc.org/initiatives/ctmatch4cc).

## Docker

    docker-compose up -d

This will create an `app` container hosting a live-reloading version of the site at `localhost:4567`. To build a static version of the site:

    docker-compose run \
      -v $PWD:/usr/src/app/source \
      -w /usr/src/app/source \
      app bundle exec middleman build --clean
