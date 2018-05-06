# lijero.co

This repo contains the entirety of my website, https://lijero.co.
It is posed in hopes that other people may find my build system useful.
In addiition, it gives an easy mechanism to submit corrections
to the content itself, such as fixing typos or minor details.
Hypothetically, it is even possible community-contributed content
might one day be submitted.

## Repository Layout

* `/templates/html-generator/` is a git submodule pointing to https://github.com/lijerom/html-generator
and will continue to do so until `html-generator` is released on Hackage,
if it ever is.
* `/templates/` contains all of the page templates and site-specific
generic content, and is imported by most pages on this site.
* `/res/` includes static resources, such as images, css, and javascript
* `/*.sh` are some buildscripts used for building the site
* The rest of this repository is the root directory of the site.

## Building

This site clearly isn't made for redistribution, being a personal website,
but hypothetically all that would need to be done is to change `baseUrl` in
`templates/Templates/Urls.hs`.
If you wish to make your own site based on my build system,
please see the dedicated repository for html-generator instead,
and merely use this page as an example.

First, clone the repo:

```bash
git clone --recursive https://github.com/lijerom/lijero.co
```

The `--recursive` option also fetches the `html-generator` submodule.
If you forgot to include the `--recursive` option, additionally run:

```bash
git submodule init
git submodule update
```

You will then need to install the Haskell Stack:

```bash
curl -sSL https://get.haskellstack.org/ | sh
```

And then build and install  html-generators and templates:

```bash
./build-templates.sh
```

You may then build the actual `xhtml` site pages using:

```bash
./build-site-no-sitemap.sh
```

I would recommend always running the `no-sitemap` variant
before running the general `build-site` variant,
because the resultant sitemap will only include the pages
which successfully compiled,
even though the previous working versions of those pages still exist.

The entire website is static,
so no special server configuration should be neccessary.
However, you can still find my nginx config in https://github.com/lijerom/lijero.co-config/.

```bash
./build-site.sh
```

## License

* html-generator, in /templates/html-generator/ is licensed GPLv3+.
* All other source code (e.g. /templates/, and /index.hs) is licensed AGPLv3+.
* The articles' content itself is licensed CC BY-SA unless otherwise specified.
