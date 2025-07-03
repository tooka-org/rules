# 📦 Tooka Rule Packs

This repository contains a collection of community-contributed **Tooka rules**, organized into reusable **packs**. These rules help you automate file organization, cleanup, and more, powered by [Tooka](https://github.com/tooka-org/tooka).


## 🔧 What Are Rule Packs?

Each **pack** is a directory that contains related rules for a specific file type or use case (e.g., `documents`, `images`, `audio`). Inside each pack you'll find:

- One or more `.yaml` rules
- A `README.md` describing what the pack does

All rules follow the schema defined in [`schema.yaml`](./schema.yaml), and are validated automatically.


## 🚀 How to Use

You can download individual rule files or entire packs. Rules are compatible with the `tooka` CLI:

```bash
tooka add my-pack
```

Monthly releases provide a bundled archive of all current rules for easy use by third-party tools and websites.


## 🤝 Contributing Rules

Want to contribute your own rule?

1. **Fork this repo**
2. **Add a new YAML file** to the correct pack (or create a new one)
3. **Include a `README.md`** if you're adding a new pack
4. **Open a Pull Request**, filling out the provided template

### Your PR will be automatically validated:

* Syntax and structure must match [`schema.yaml`](./schema.yaml)
* Validation is run via `tooka validate`

If the rule passes, your PR will be reviewed and merged.


## 📦 Monthly Releases

On the 1st of each month:

* A GitHub Action bundles all current packs into a `.tar.gz` archive
* A draft GitHub Release is created with the new version (e.g., `v25.07.0`)
* Third-party tools and websites can fetch these bundles to stay up to date

### Versioning Format

Releases use the format:

```sh
vX.Y.Z
```

Where:

* `X` = last two digits of the **year** (e.g. `25` for 2025)
* `Y` = **month** (e.g. `07` for July)
* `Z` = patch number — usually `0`, but can be incremented (`1`, `2`, etc.) for additional releases in the same month

**Example:**

* `v25.07.0`: First release in July 2025
* `v25.07.1`: Additional release in July due to multiple PRs merged mid-month

This allows consumers to track updates more precisely, and ensures release uniqueness.


## 📘 Resources

* [Tooka CLI on GitHub](https://github.com/tooka-org/tooka)
* [Rule Schema](./schema.yaml)
* [Packs Directory](./packs)


Thanks for contributing and helping grow the Tooka rule ecosystem!

## ⚠️ Disclaimer

Tooka **only validates the syntax and format** of submitted rules — **it does not execute them** during the validation process.

As a user, **you are fully responsible** for reviewing any rule before using it.
- **Always inspect the rule logic yourself** and make sure it does what you expect.
- We strongly recommend running Tooka in **dry-run mode first**:

```bash
tooka sort ... --dry-run
```

Use with caution — especially if a rule includes destructive actions like `delete`.
