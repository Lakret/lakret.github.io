# lakret.github.io
Dev blog

## Customizations

Based on Minima theme. 

Customized SCSSs; replaced highlighter with custom highlight.js install. Customized footer.

## Install

```bash
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E206 9D6956105BD0E739499BDB
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -
curl -sSL https://get.rvm.io | bash -s stable
rvm install 2.6
gem install bundler github-pages jekyll
bundle install
```

## Running locally

```bash
bundle exec jekyll serve
```