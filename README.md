# GitHub Actions for kdb

A collection of reusable GitHub Actions for installing and testing kdb-x in CI workflows.

## Available actions

| Action | Description |
| --- | --- |
| [`setup-kdb-x`](setup-kdb-x/action.yml) | Download kdb-x for the runner platform and install a license from a base64 string. |
| [`qmamba`](qmamba/action.yml) | Install a [KxSystems/qmamba](https://github.com/KxSystems/qmamba) release into `QHOME/mod`. Run after `setup-kdb-x`. Not supported on Windows. |
| [`unit-test`](unit-test/action.yml) | Install the `test.q` from the [unit-test module](https://github.com/KxSystems/unit-test) into `QHOME/mod/kx`. Run after `setup-kdb-x`. |

## Setup

You will need to provide a license before you can run the github actions.
Your community license can be used. If you used the KDB-X installer to install KDB-X, the default location for the license is `~/.kx/kc.lic`

You can upload the license through the github UI or follow the steps below using the [github CLI](https://docs.github.com/en/github-cli/github-cli/quickstart). Update the repository name to match your own.
```bash
export KDB_LICENSE_B64=$(base64 -w 0 ~/.kx/kc.lic)
gh secret set KDB_LICENSE_B64 --repo repo/myModule
```

## Example

```yaml
steps:
  - uses: actions/checkout@v4
  - uses: KxSystems/github-actions/setup-kdb-x@main
    with:
      license-b64: ${{ secrets.KDB_LICENSE_B64 }}
  - uses: KxSystems/github-actions/unit-test@main
```
