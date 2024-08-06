#!/bin/bash

# Array of dates and commit messages
commits=(
    "2023-04-02 05:23:47|Updating README file"
    "2023-04-10 14:12:29|Updating Flask application"
    "2023-04-30 03:37:51|Fixing bugs in authentication"
    "2023-05-15 10:48:19|Refactoring codebase"
    "2023-06-05 18:04:53|Improving performance of data processing"
    "2023-06-22 07:20:11|Adding new features to the dashboard"
    "2023-07-15 15:56:48|Updating dependencies"
    "2023-08-01 02:03:25|Fixing UI issues"
    "2023-08-20 09:17:44|Enhancing logging functionality"
    "2023-09-10 16:29:57|Correcting typo in documentation"
    "2023-09-28 23:12:01|Optimizing database queries"
    "2023-10-18 05:45:22|Implementing new API endpoints"
    "2023-11-02 13:59:11|Updating styling for the homepage"
    "2023-11-20 22:18:34|Refactoring data model"
    "2023-12-08 06:02:15|Adding unit tests"
    "2023-12-23 14:11:27|Updating build scripts"
    "2024-01-15 21:30:59|Improving error handling"
    "2024-02-01 08:19:37|Adjusting configuration settings"
    "2024-02-20 16:54:03|Updating user interface components"
    "2024-03-10 00:12:42|Enhancing security features"
    "2024-03-30 09:43:17|Updating README file"
    "2024-04-15 19:30:22|Updating Flask application"
    "2024-05-01 03:22:56|Fixing bugs in authentication"
    "2024-05-12 12:34:10|Refactoring codebase"
    "2024-05-25 20:05:40|Improving performance of data processing"
    "2024-06-10 04:43:18|Adding new features to the dashboard"
    "2024-06-30 13:09:47|Updating dependencies"
    "2024-07-15 22:56:29|Fixing UI issues"
    "2024-08-01 08:45:50|Enhancing logging functionality"
    "2024-08-20 17:32:14|Correcting typo in documentation"
    "2024-09-05 01:29:46|Optimizing database queries"
    "2024-09-22 09:00:13|Implementing new API endpoints"
    "2024-10-10 17:21:55|Updating styling for the homepage"
    "2024-10-25 02:11:20|Refactoring data model"
    "2024-11-10 10:42:08|Adding unit tests"
    "2024-11-25 18:19:33|Updating build scripts"
    "2024-12-10 03:54:09|Improving error handling"
    "2024-12-25 11:40:55|Adjusting configuration settings"
    "2024-12-30 20:22:39|Updating user interface components"
    "2024-01-15 06:03:45|Enhancing security features"
)

# Ensure the repository is clean
if ! git diff-index --quiet HEAD --; then
  echo "Your working directory is not clean. Please commit or stash your changes before running this script."
  exit 1
fi

# Loop through the array
for commit in "${commits[@]}"; do
  IFS='|' read -r commit_date commit_message <<< "$commit"

  # Set the committer date
  export GIT_COMMITTER_DATE="$commit_date"
  export GIT_AUTHOR_DATE="$commit_date"

  # Create empty commit
  git commit --allow-empty -m "$commit_message" --date "$commit_date"
done
