# Pronto Action

A Github action to run [pronto](https://github.com/prontolabs/pronto).

## Support Pronto runners

This action support the following runners.

- [pronto\-brakeman](https://github.com/prontolabs/pronto-brakeman)
- [pronto\-eslint\_npm](https://github.com/doits/pronto-eslint_npm)
- [pronto\-rails\_best\_practices](https://github.com/prontolabs/pronto-rails_best_practices)
- [pronto\-rubocop](https://github.com/prontolabs/pronto-rubocop)
- [pronto\-scss](https://github.com/prontolabs/pronto-scss)
- [pronto\-slim\_lint](https://github.com/ibrahima/pronto-slim_lint)

## Suport Rubocop extentions

- [rubocop\-i18n](https://github.com/puppetlabs/rubocop-i18n)
- [rubocop\-md](https://github.com/rubocop-hq/rubocop-md)
- [rubocop\-minitest](https://github.com/rubocop-hq/rubocop-minitest)
- [rubocop\-performance](https://github.com/rubocop-hq/rubocop-performance)
- [rubocop\-rails](https://github.com/rubocop-hq/rubocop-rails)
- [rubocop\-rake](https://github.com/rubocop-hq/rubocop-rake)
- [rubocop\-require\_tools](https://github.com/milch/rubocop-require_tools)
- [rubocop\-rspec](https://github.com/rubocop-hq/rubocop-rspec)
- [rubocop\-sequel](https://github.com/rubocop-hq/rubocop-sequel)
- [rubocop\-thread\_safety](https://github.com/covermymeds/rubocop-thread_safety)

## Usage

Create Github workflow yaml file in *.github/workflows* directory of your repository.

### Input parameters

This action can be configured by the following input parameters.

| name | reqire | default |
|---|---|---|
| github_token | true | -- |
| commit | false | origin/master |
| runner | false | pronto |
| formatters | false | github_status github_pr |

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
    steps:
      - uses: actions/checkout@v1
      - uses: HeRoMo/pronto-action@v0.4.0
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
```

### For running eslint_npm runner

If you would like to use eslint_npm runner, you have to setup Node.js and run `yarn install`(or `npm install`) before using pronto-action.

The following yaml define a workflow use eslint_npm.

```yaml
name: Pronto
on:
  pull_request:
    types: [opened, synchronize]
jobs:
  eslint_npm:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - name: Setup Node.js
        uses: actions/setup-node@v1
        with:
          node-version: '12.14.x'
      - name: yarn install
        run: yarn install
      - name: pronto run
        uses: HeRoMo/pronto-action@v0.4.0
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          runner: eslint_npm
```

If does not work successfully, configure elint_npm with  *.pronto_eslint_npm.yml* file. see [Configuration of ESLintNPM](https://github.com/doits/pronto-eslint_npm#configuration-of-eslintnpm)

## LICENSE
[MIT](LICENSE)
