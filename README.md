# Pronto Action

A Github action to run [pronto](https://github.com/prontolabs/pronto).

## Usage

Create *.github/workflows/pronto.yaml* file, which contains the followings in your repository.

```yaml
name: Pronto
on:
  pull_request:
    types: [opened, synchronize]
jobs:
  pronto:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - uses: HeRoMo/pronto-action@develop
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
```

### Input parameters

This action can be configured by the following input parameters.

| name | reqire | default |
|---|---|---|
| github_token | true | -- |
| commit | false | origin/master |
| runner | false | pronto |
| formatters | false | github_status github_pr |

see [Pronto usage](https://github.com/prontolabs/pronto#usage).

### Support runners

This action support the following runners.

- pronto-brakeman
- pronto-rails_best_practices
- pronto-rubocop
- pronto-slim_lint

## LICENSE
[MIT](LICENSE)
