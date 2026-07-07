default:
    just -l

# Squash everything (history + working tree) into a single commit and force-push.
commit msg="Slopfix landing page":
    git add -A
    git reset --soft $(git rev-list --max-parents=0 HEAD)
    git commit --amend -m "{{msg}}"
    git push --force-with-lease origin main

serve:
    python3 -m http.server 8000