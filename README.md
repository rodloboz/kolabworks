# Kolab.Works

## Development Setup

1. `mix deps.get`

2. `mix ecto.setup`

3. `cd assets && yarn install`

4. `mix phx.server` Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Development Workflow

1. `git checkout master`

2. `git checkout -b rf-new-feature` (prefix branch name with initials)

3. Make the changes

4. `git push origin rf-new-feature` to squash any commits

5. Open a PR to merge with `master`, `development` or `release`
