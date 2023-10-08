# skelton71

My Ruby on Rails 7.1 boilerplate.

* Ruby 3.2.2
* Ruby on Rails 7.1.0
  * `rails new . -T -d=trilogy -c=bootstrap`
* Use Trilogy
* Haml
* FontAwesome
* Active Record Session Store
* active_decorator
* dotenv
* Whenever
* Awesome Print
* Annotate
* rack-dev-mark
* RSpec
* DatabaseRewinder
* factory_bot
* Brakeman
* rails_best_practices
etc...

## How to use

Use [setup.rb](https://raw.githubusercontent.com/h-izumi/skelton71/main/setup.rb):

```shell
cd /path/to/app-parent
curl -L https://raw.githubusercontent.com/h-izumi/skelton71/trilogy/setup.rb | APP_NAME="app-name" ruby
```

* Set `NO_COMMIT=true` to skip `git commit`.

```shell
curl -L https://raw.githubusercontent.com/h-izumi/skelton71/trilogy/setup.rb | APP_NAME="app-name" NO_COMMIT=true ruby
```

or Manually:

```shell
cd /path/to/app-parent
curl -L -o skelton71.zip https://github.com/h-izumi/skelton71/archive/main.zip
unzip skelton71.zip
mv skelton71-trilogy app-name
rm skelton71.zip
cd app-name
find . -type f -print0 | xargs -0 sed -i -e 's/SKELTON71/APP_NAME/g'
find . -type f -print0 | xargs -0 sed -i -e 's/skelton71/app_name/g'
find . -type f -print0 | xargs -0 sed -i -e 's/Skelton71/AppName/g'
rm README.md
rm LICENSE.txt
rm setup.rb
git init
git add .
git commit -m "initial."
```

If use on macOS, you should set argument ` ''` after `sed -i`, like `sed -i '' -e`.

## License

[CC0 1.0](https://creativecommons.org/publicdomain/zero/1.0/deed).

You probably should remove `LICENSE.txt` file when use this repo on your work.
