# Pronto Action

A Github action to run [pronto](https://github.com/prontolabs/pronto).

## Support Pronto runners

This action support the following pronto runners.

- [pronto\-brakeman](https://github.com/prontolabs/pronto-brakeman)
- [pronto\-eslint\_npm](https://github.com/doits/pronto-eslint_npm)
- [pronto\-rails\_best\_practices](https://github.com/prontolabs/pronto-rails_best_practices)
- [pronto\-rubocop](https://github.com/prontolabs/pronto-rubocop)
- [pronto\-scss](https://github.com/prontolabs/pronto-scss)
- [pronto\-slim\_lint](https://github.com/ibrahima/pronto-slim_lint)
- [pronto\-sorbet](https://github.com/teamsimplepay/pronto-sorbet)

## Suport Rubocop extentions

This action support the following rubocop extentions.

- Rubocop Official Extensions
  - [rubocop\-performance](https://github.com/rubocop-hq/rubocop-performance)
  - [rubocop\-rails](https://github.com/rubocop-hq/rubocop-rails)
  - [rubocop\-rspec](https://github.com/rubocop-hq/rubocop-rspec)
  - [rubocop\-minitest](https://github.com/rubocop-hq/rubocop-minitest)
  - [rubocop\-rake](https://github.com/rubocop-hq/rubocop-rake)
  - [rubocop\-sequel](https://github.com/rubocop-hq/rubocop-sequel)
  - [rubocop\-thread\_safety](https://github.com/covermymeds/rubocop-thread_safety)
- Third-party Extensions (introduced in official docs)
  - [rubocop\-require\_tools](https://github.com/milch/rubocop-require_tools)
  - [rubocop\-i18n](https://github.com/puppetlabs/rubocop-i18n)
  - [rubocop\-packaging](https://github.com/utkarsh2102/rubocop-packaging)
  - [rubocop\-sorbet](https://github.com/Shopify/rubocop-sorbet)
  - [rubocop\-graphql](https://github.com/DmitryTsepelev/rubocop-graphql)
- Other Extensions
  - [rubocop\-md](https://github.com/rubocop-hq/rubocop-md)

pronto-rubocop supports suggestion comments on Github pullrequest. 
see https://github.com/prontolabs/pronto-rubocop#suggestions

## Usage

Create Github workflow definition yaml file in *.github/workflows* directory of your repository.

### Input parameters

This action can be configured by the following input parameters.
<!-- textlint-disable spellcheck-tech-word -->
| name | require | default | description |
|---|---|---|---|
| github_token | false | ${{ github.token }} | default value is setted by github workflow automatically. |
| commit | false | `origin/${{ github.base_ref }}` | Commit for the diff.<br>(`origin/main`, if base of pullrequest is `main`) |
| runner | false | `rubocop` | Run only the passed runners. |
| formatters | false | `github_status github_pr` | Pick output formatters. |
| path | false | `'.'` | Relative path to check. |
<!-- textlint-enable spellcheck-tech-word -->
see [Pronto usage](https://github.com/prontolabs/pronto#usage).

## Github workflow definition samples

### For running rubocop runner

The followoing yaml is a simplest workflow difinition of using pronto-action.

```yaml
name: Pronto
on:
  pull_request:
    types: [opened, synchronize]
jobs:
  pronto:
    runs-on: ubuntu-latest
    permissions:
      pull-requests: write
      statuses: write 
    steps:
      - uses: actions/checkout@v3
        with:
          fetch-depth: 0
      - uses: HeRoMo/pronto-action@v1.45.0
```

### For running eslint_npm runner

By using eslint_npm runner, you can check your code by eslint. 
To use eslint_npm, setup Node.js and run `yarn install`(or `npm install`) before using pronto-action.

The following yaml define a workflow use eslint_npm.

```yaml
name: Pronto
on:
  pull_request:
    types: [opened, synchronize]
jobs:
  eslint_npm:
    runs-on: ubuntu-latest
    permissions:
      pull-requests: write
      statuses: write 
    steps:
      - uses: actions/checkout@v3
        with:
          fetch-depth: 0
      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version-file: '18'
          cache: 'yarn'
      - name: yarn install
        run: yarn install
      - name: pronto run
        uses: HeRoMo/pronto-action@v1.45.0
        with:
          runner: eslint_npm
```

If does not work successfully, configure elint_npm with  *.pronto_eslint_npm.yml* file. see [Configuration of ESLintNPM](https://github.com/doits/pronto-eslint_npm#configuration-of-eslintnpm)

## Required `permissions` in GitHub workflow

When *Read repository contents permission* in *Settings/Actions* of the repository is setted, you have to add `permissions` to the Github workflow difinition YAML.

The following permissions are required.

- pull-requests: write
- statuses: write

The followoing yaml is a workflow difinition of pronto-action with permissions.

```yaml
name: Pronto
on:
  pull_request:
    types: [opened, synchronize]
jobs:
  pronto:
    runs-on: ubuntu-latest
    permissions:
      pull-requests: write
      statuses: write 
    steps:
      - uses: actions/checkout@v3
        with:
          fetch-depth: 0
      - uses: HeRoMo/pronto-action@v1.45.0
```

## LICENSE
[MIT](LICENSE)
