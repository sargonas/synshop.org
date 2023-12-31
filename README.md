[![Lint Code Base](https://github.com/synshop/synshop.org/actions/workflows/super-linter.yml/badge.svg?branch=main)](https://github.com/synshop/synshop.org/actions/workflows/super-linter.yml)
![CloudFlare Pages](https://img.shields.io/endpoint?url=https://cloudflare-pages-badges.purple-wildflower-8ee3.workers.dev/?projectName=synshop-org)
[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/synshop/synshop.org/main/LICENSE)

![Jekyll](https://a11ybadges.com/badge?logo=jekyll)
![Markdown](https://a11ybadges.com/badge?logo=markdown)
![Ruby on Rails](https://a11ybadges.com/badge?logo=rubyonrails)
![HTML5](https://a11ybadges.com/badge?logo=html5)
![stylelint](https://a11ybadges.com/badge?logo=stylelint)
![Sass](https://a11ybadges.com/badge?logo=sass)
![Cloudflare](https://a11ybadges.com/badge?logo=cloudflare)



# [SynShop.org](https://synshop.org/) website


A Jekyll based site using the Minimal Mistakes theme.

A full support guide [can be found here:](https://mmistakes.github.io/minimal-mistakes/docs/quick-start-guide/)


## Installation

- Download this repository
- Install the required gems: `bundle install`
- Run the jekyll server: `bundle exec jekyll serve`

You should have a server up and running locally on the usual dev/test port of 4000

## Configuration

The main settings happen inside of the _config.yml_ file

## Key info

- Equipment can be added by adding a new markdown file per piece of equipment to the \_equipment folder. When doing so, it's important to match the Front Matter style of the existing ones, as each component plays a key role in the current site look and layout. Equipment has a manual sort order configured via a `order` front matter tag to force the "rooms" at the top of the listing, and then individual items after in alphabetical order. To alleviate future headache of mass renumbering when inserting a new item, initial items are numbered in multiples of 10 to leave room for plenty of insertions without major renumbering.

- New pages can be added by writing them in HTML or MD inside the \_Pages folder.

- If you wish to have a page appear in the top Nav Bar, it is managed by the \_data/navigation.yml file. You will also need to update it in each html file in the template folder inside the membership.synshop.org repo. _(However the current nav bar is at max width, and new entries will result in a hamburger menu to the far right)_

## Redirects

Redirects are managed "outside" the jekyll config by Cloudflare pages itself. It does this by way of of reading the \_redirects file. In the event a redirect of a url with a trailing / is required, you will need to add a second entry line for the same entry with a trailing /.

Example:
```text
/info /about 301
/info/ /info 301
```
As a matter of best practices, it's best to have the second redirect point to the first, to minimize room for error when making updates to a redirect to avoid having them go to different places. _(Additionally, general http convention calls for /example to be a file and /example/ to be a directory, and one should generally not create redirects for trailing slashes for non-folders. However as the old site was set up this way, the existing ones have been preserved to maintain SEO but it is NOT advised for new ones to be created unless for a specific requirement.)_

## 404 Page
Cloudflare pages requires a 404.html in the root directory in order to render a custom 404 and not default to all bad pages falling back on the homepage. 404.md is configured to include what it needs to maintain UI design consistency, and kick out a 404.html at build

## SuperLinter
SuperLinter is enabled on this repo. Full instructions on how to configure it further can be found at https://github.com/super-linter/super-linter. It's config is managed at `.github/workflows/super-linter.yml`

In short, it has defaults that apply, unless you create a custom config file for the individual linter component in question inside `.github/linters`. By doing so, you can override the defaults of specific rules, or entire linters. Only relevant linters will be automatically run, based on the file extensions and code found in the repo.

Separate from superlinter, but managed in the same `workflows` section, is a link-checks.yaml file that will validate all links, both internal and external, are valid.

## Cloudflare deployment

Changes to `main` will deploy automatically to Cloudflare and update the website. Changes to branches will always build out to temporary cloudflare preview pages, whose URLs can be found within the GitHub actions for that particular branch or PR. Each commit will have its own URL based on the hash at `<something>.synshop-org.pages.dev`, but also each branch will have an alias to the latest commit for that branch at `<branch-name>.synshop-org.pages.dev`. _(Please remember to always check the URL in any PRs and manually review all changes on the dev site build before merging the PR!)_

CF does not use the default Jekyll settings, instead it uses a custom build command with `jekyll build && cp _redirects _site/_redirects`, which allows for the redirects to work as expected. (Default selection of Jekyll from the drop down will only result in `jekyll build`)

In the project settings for the Pages entry for this in Cloudflare, it is important to make sure the `RUBY_VERSION` environment variable is always set to the same version as the one inside `minimal-mistakes-jekyll.gemspec`. It would be best to leave this version as currently set, unless an update is needed for dependency or security issues.

## License

The MIT License (MIT)

Copyright (c) 2013-2020 Michael Rose and contributors

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

Minimal Mistakes incorporates icons from [The Noun Project](https://thenounproject.com/)
creators Garrett Knoll, Arthur Shlain, and tracy tam.
Icons are distributed under Creative Commons Attribution 3.0 United States (CC BY 3.0 US).

Minimal Mistakes incorporates [Font Awesome](http://fontawesome.io/),
Copyright (c) 2017 Dave Gandy.
Font Awesome is distributed under the terms of the [SIL OFL 1.1](http://scripts.sil.org/OFL)
and [MIT License](http://opensource.org/licenses/MIT).

Minimal Mistakes incorporates photographs from [Unsplash](https://unsplash.com).

Minimal Mistakes incorporates [Susy](http://susy.oddbird.net/),
Copyright (c) 2017, Miriam Eric Suzanne.
Susy is distributed under the terms of the [BSD 3-clause "New" or "Revised" License](https://opensource.org/licenses/BSD-3-Clause).

Minimal Mistakes incorporates [Breakpoint](http://breakpoint-sass.com/).
Breakpoint is distributed under the terms of the [MIT/GPL Licenses](http://opensource.org/licenses/MIT).

Minimal Mistakes incorporates [FitVids.js](https://github.com/davatron5000/FitVids.js/),
Copyright (c) 2013 Dave Rubert and Chris Coyier.
FitVids is distributed under the terms of the [WTFPL License](http://www.wtfpl.net/).

Minimal Mistakes incorporates [Magnific Popup](http://dimsemenov.com/plugins/magnific-popup/),
Copyright (c) 2014-2016 Dmitry Semenov, http://dimsemenov.com.
Magnific Popup is distributed under the terms of the MIT License.

Minimal Mistakes incorporates [Smooth Scroll](http://github.com/cferdinandi/smooth-scroll),
Copyright (c) 2019 Chris Ferdinandi.
Smooth Scroll is distributed under the terms of the [MIT License](http://opensource.org/licenses/MIT).

Minimal Mistakes incorporates [Gumshoejs](http://github.com/cferdinandi/gumshoe),
Copyright (c) 2019 Chris Ferdinandi.
Gumshoejs is distributed under the terms of the [MIT License](http://opensource.org/licenses/MIT).

Minimal Mistakes incorporates [jQuery throttle / debounce](http://benalman.com/projects/jquery-throttle-debounce-plugin/),
Copyright (c) 2010 "Cowboy" Ben Alman.
jQuery throttle / debounce is distributed under the terms of the [MIT License](http://opensource.org/licenses/MIT).

Minimal Mistakes incorporates [GreedyNav.js](https://github.com/lukejacksonn/GreedyNav),
Copyright (c) 2015 Luke Jackson.
GreedyNav.js is distributed under the terms of the [MIT License](http://opensource.org/licenses/MIT).

Minimal Mistakes incorporates [Jekyll Group-By-Array](https://github.com/mushishi78/jekyll-group-by-array),
Copyright (c) 2015 Max White <mushishi78@gmail.com>.
Jekyll Group-By-Array is distributed under the terms of the [MIT License](http://opensource.org/licenses/MIT).

Minimal Mistakes incorporates [@allejo's Pure Liquid Jekyll Table of Contents](https://allejo.io/blog/a-jekyll-toc-in-liquid-only/),
Copyright (c) 2017 Vladimir Jimenez.
Pure Liquid Jekyll Table of Contents is distributed under the terms of the [MIT License](http://opensource.org/licenses/MIT).

Minimal Mistakes incorporates [Lunr](http://lunrjs.com),
Copyright (c) 2018 Oliver Nightingale.
Lunr is distributed under the terms of the [MIT License](http://opensource.org/licenses/MIT).