test: ## Run the tests
	bundle exec rails test

build: ## Install or update dependencies
	bundle install && rails db:migrate

run: ## Start the app server
	bundle exec rails s

.PHONY: build run test

