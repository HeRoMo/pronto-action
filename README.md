# Pronto Action

A Github action to run pronto.

## Github Worflow setting

Create *.github/workflows/pronto.yaml* file, which contains the followings in your repository

```yaml
name: Pronto
on:
  pull_request:
    types: [opened, synchronize]
jobs:
  github-labeler:
    name: pronto
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - uses: HeRoMo/pronto-action@develop
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
```

### Input Args

| name | reqire | default |
|---|---|---|
| github_token | true | -- |
| commit | false | origin/master |
| runner | false | pronto |
| formatters | false | github_status github_pr |

### Support runners

- pronto-brakeman
- pronto-rails_best_practices
- pronto-rubocop
- pronto-slim_lint

## LICENSE
[MIT](LICENSE)
