# A Commit A Day

Automatically plant a commit a day to green your GitHub profile.

---

## Quick Start

This repo will help you run a free cronjob to commit daily to another GitHub repo with Heroku.

### Preparation

- Generate a GitHub access token at [Settings > Developer settings](https://github.com/settings/tokens)
- Create a new private GitHub repo to store your commits
- Change your `Overview > Contribution Setting` to Private contributions
- Create a Heroku app to host and run your app

### Setup

```sh
# Go to your terminal, clone this repo
git clone https://github.com/phuwn/a-commit-a-day.git
cd a-commit-a-day

# Connect to Heroku and setup your app
heroku login
heroku git:remote -a a-commit-a-day

# Set buildpack for our app, since my script are shell script, so...
heroku buildpacks:set https://github.com/niteoweb/heroku-buildpack-shell.git

# Provide your GitHub details
# Your commit repo url
heroku config:set GITHUB_CLONE_URL=https://{YOUR_GITHUB_ACCESS_TOKEN}@{YOUR_GITHUB_REPO}
heroku config:set GITHUB_USER_EMAIL={YOUR_GITHUB_EMAIL}
heroku config:set GITHUB_USER_NAME={YOUR_GITHUB_NAME}

# Push my script to your app
git push heroku main
```

### Create A Scheduler

Here are some steps to setup a free scheduler to commit every day for you

- Set your credit card information in Heroku at [Manage Account > Billing](https://dashboard.heroku.com/account/billing)
- Go back to my repo and run `heroku addons:create scheduler:standard`
- Create a Scheduler Job at `Resources > Add-ons > Heroku Scheduler > Add Job`
- Schedule Interval is `Every day at 12:00 AM`, Run Command is `./commit.sh`

### Reference

For more information please check out my article [Let’s Green Your GitHub](https://phuwn.medium.com/lets-green-your-github-e7618122dc2)

- [3 Step Setting up Heroku schedule (cron) job](https://hackernoon.com/3-step-setting-up-heroku-schedule-cron-job-example-tutorial-set-up-node-dyno-14d1d8ccfe4f)
- [Heroku Buildpack: Shell](https://elements.heroku.com/buildpacks/niteoweb/heroku-buildpack-shell)
