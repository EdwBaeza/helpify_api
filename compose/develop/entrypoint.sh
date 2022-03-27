#!/bin/sh
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /helpify_api/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
echo "Entrypoint...."

exec "$@"
