# README

# Eiyo_Recipe

"Eiyo_Recipe" is a database of recipes with nutrients chart.

# Features

In Eiyo_Recipe

-You can browse the database of recipes.
You can find the recipe by keyword and nutrients items with search function.

-You can check Nutritional value intake standard.
Eiyo_Recipe provide chart every recipes with its nutrients (if its recorded) and Nutritional value intake standard with.

-You can make recipe as you like.

If you add some recipes to your favorites, you can check nutrition quantity by calcurate those.

-You can make recipe with a information, picure, procedure, nutorients.
If you want, you can reuse past recipes as ingredients and reflect those nutrients in your recipe.

# diagram

![](https://raw.githubusercontent.com/junjun491/jcookpad/master/Untitled%20Diagram.drawio.png)

# Tech

- Ruby 2.7
- vue 2.6
- Ruby on Rails 6.1.3.2
- MySQL 5.7.34
- Nginx
- Puma
- AWS
- -VPC
- ー EC2
- ー RDS
- ー Route53
- ー AWS Certificate Manager
- ー ALB
- Docker/Docker-compose

# Installation

under construction

# Usage

under construction

-Commands:deploy in development

docker-compose -f docker-compose-local.yml build --no-cache  
docker-compose -f docker-compose-local.yml up  
docker-compose exec app rails db:create db:migrate  
docker-compose exec app rails db:seed

-Commands:deploy in production

docker-compose -f docker-compose-production.yml down  
aws reboot  
docker volume rm `docker volume ls -q -f dangling=true`  
docker system prune -f  
docker-compose -f docker-compose-production.yml build

or

docker-compose -f docker-compose-production.yml run app rails webpacker:install RAILS_ENV=production  
docker-compose -f docker-compose-production.yml run app rails webpacker:install:vue RAILS_ENV=production  
docker-compose -f docker-compose-production.yml run app rails webpacker:compile RAILS_ENV=production  
docker-compose -f docker-compose-production.yml run app rails assets:precompile RAILS_ENV=production  
docker-compose -f docker-compose-production.yml run app rails restart RAILS_ENV=production

or

docker-compose -f docker-compose-production.yml run app rails tmp:cache:clear  
docker-compose -f docker-compose-production.yml run app bundle exec rake assets:clobber RAILS_ENV=production  
docker-compose -f docker-compose-production.yml run app bundle exec rake assets:precompile RAILS_ENV=production  
docker-compose -f docker-compose-production.yml run app rails restart RAILS_ENV=production

# Note

under construction

Thank you!
