# jamestmartin.me
This is the source code for my personal website, [jamestmartin.me](https://jamestmartin.me).

## Installation
This project is built using [Jekyll](https://jekyllrb.com/), a static site generator.

To install this website, you must first [install Jekyll](https://jekyllrb.com/docs/installation/).
Next, install all necessary modules with `bundle exec`.

To build the site, run `bundle exec jekyll build`.
To rebuild the site continuously as updates are made,
run `bundle exec jekyll build --watch`.
The web root for the website will be `_site/`.
You may point your web server there and the site will work with no additional effort.

To work on the site without installing full web server, use `bundle exec jekyll serve`.

## Code Conventions
All of my code is valid HTML5 and CSS3 according to [WHATWG standards](https://html.spec.whatwg.org)

I follow the [Google HTML/CSS Style Guide](https://google.github.io/styleguide/htmlcssguide.html).
Google recommends dropping optional tags wherever possible;
I know how to write valid XHTML polyglot as well, but choose not to as per the style guide.
