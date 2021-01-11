set current_branch (git rev-parse --abbrev-ref HEAD)
git push -u origin "$current_branch"
hub pull-request -h "$current_branch"