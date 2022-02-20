#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /blog/tmp/pids/server.pid

cd /blog/ && bundle exec rails db:create && bundle exec rails db:migrate
# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
