chmod 777 commit.sh

git clone "$(cat $ENV_DIR/GITHUB_CLONE_URL)" _
git --git-dir=_/.git config user.email "$(cat $ENV_DIR/GITHUB_USER_EMAIL)" 
git --git-dir=_/.git config user.name "$(cat $ENV_DIR/GITHUB_USER_NAME)"