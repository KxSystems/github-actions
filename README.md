# GitHub Actions for kdb

A collection of reusable GitHub Actions for installing and testing kdb-x in CI workflows.

## Available actions

| Action | Description |
| --- | --- |
| [`setup-kdb-x`](setup-kdb-x/action.yml) | Download kdb-x for the runner platform and install a license from a base64 string. |
| [`qmamba`](qmamba/action.yml) | Install a [KxSystems/qmamba](https://github.com/KxSystems/qmamba) release into `QHOME/mod`. Run after `setup-kdb-x`. Not supported on Windows. |
| [`unit-test`](unit-test/action.yml) | Install `test.q` from [KxSystems/unit-test](https://github.com/KxSystems/unit-test) into `QHOME/mod/kx`. Run after `setup-kdb-x`. |

## Example

```yaml
steps:
  - uses: actions/checkout@v4
  - uses: KxSystems/github-actions/setup-kdb-x@main
    with:
      license-b64: ${{ secrets.KDB_LICENSE_B64 }}
  - uses: KxSystems/github-actions/unit-test@main
```
