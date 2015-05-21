# Hubstats

Hubstats is a rails plugin which allows you to search and monitor pull requests made across a collection of repositories. It also gives extra statistics about users and pull requests not found on GitHub.

## Setup

 Run `rails generate hubstats:install`.

 Run `rake hubstats:install:migrations`.


 Run `rake hubstats:setup` to run the necessary migrations and start pulling data from Github.

 Add 'mount Hubstats::Engine => "/hubstats"' to your apps routes file.

## Configuration

### Authentication

Hubstats needs Github credentials to access your repos, these can be setup in one of two ways:

#### octokit.yml

Add your GitHub API token or ClientID and Secret to octokit.yml.

#### Environment Variables

Hubstats can also use OAUTH access tokens stored in ENV["GITHUB_API_TOKEN"] or for Application Authentication in ENV["CLIENT_ID"] and ENV["CLIENT_SECRET"], if for some reason you don't want to store them in octokit.yml.

### Webhooks

Hubstats uses GitHub webhooks to keep itself update. It requires you to set a secret as well as an endpoint to push to.

To generate a secret run:

 ```
 ruby -rsecurerandom -e 'puts SecureRandom.hex(20)'
 ``` 

Set the endpoint to be:

 www.yourdomain.com/hubstats/handler

### Repositories 

Hubstats needs to know what repos for it to watch. You can set it to watch either an entire organization or a list of specific repos in octokit.yml.

## TL:DR
  Run `rails generate hubstats:install`.
  Configure octokit.yml with your Github information.
  Run `rake hubstats:install:migrations`.
  Run `rake hubstats:setup`.
  Add 'mount Hubstats::Engine => "/hubstats"' to your routes file.

This project rocks and uses MIT-LICENSE.