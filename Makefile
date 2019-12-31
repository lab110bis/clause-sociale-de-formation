test: ## Run the tests
	bundle exec rspec

build: ## Install or update dependencies
	bundle install && rails db:migrate

run: ## Start the app server
	bundle exec rails s

deploy: ## Deploy app
	git push git@ssh.osc-fr1.scalingo.com:clause-sociale-de-formation.git master -f

.PHONY: build run test

