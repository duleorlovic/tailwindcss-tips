# Tailwind Tips

You can start designing with https://tailwindcss.com/ with livereload just like
on their landing page.

## Install

Start we `-j` and `--css` options on `rails new` command
```
rails new tailwind_livereload -j esbuild --css tailwind
cd tailwind_livereload
```
Than add build scripts to package.json
```
# package.json
  "scripts": {
    "build": "esbuild app/javascript/*.* --bundle --sourcemap --outdir=app/assets/builds",
    "build:css": "tailwindcss -i ./app/assets/stylesheets/application.tailwind.css -o ./app/assets/builds/application.css"
  },
```
Than create sample page
```
rails g controller pages index --no-helper --no-test

# config/routes.rb
  root 'pages#index'
```

Install livereload

```
# Gemfile
group :development do
  gem "hotwire-livereload"
end

# this will enable some options
rails livereload:install

# config/environments/development.rb
config.hotwire_livereload.listen_paths << Rails.root.join("app/assets/builds")
```
You do not need any extension or add-on for firefox chrome safari.

Autosorting classes using prettier is performed using Coc
https://github.com/iamcco/coc-tailwindcss
```
:CocInstall coc-tailwindcss
```


# Features

Whats new in v3.0 https://www.youtube.com/watch?v=mSC6GwizOag
* 
