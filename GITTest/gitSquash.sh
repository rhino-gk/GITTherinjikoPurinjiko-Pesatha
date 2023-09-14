  PARENT_BRANCH=main
  BACKUP_BRANCH= backup2289

  CURRENT_BRANCH=$(git branch --show-current)

  git branch $BACKUP_BRANCH
  BACKUP_SUCCESS=$?

  if [ $BACKUP_SUCCESS -eq 0 ]; then
    git reset $(git merge-base $PARENT_BRANCH $CURRENT_BRANCH)
    git add -A
    git commit
    echo "Squashed $CURRENT_BRANCH. Backup of original created at $BACKUP_BRANCH$"
  else
    echo "Could not create backup branch. Aborting squash"
  fi

