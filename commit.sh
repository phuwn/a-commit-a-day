git --git-dir=_/.git pull
git --git-dir=_/.git commit --allow-empty -m "$(date '+%Y-%m-%d %H:%M:%S')"
git --git-dir=_/.git push