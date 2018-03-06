# github-label-maker

A set of bash scripts for deleting / creating labels within Github

---

If you're like me, you create a bunch of Github repos all of the time. And if you're also like me, you work on a team of talented developers who expect a standard set of labels to be present with they're opening PRs. Up until now, I've been creating these manually. I finally decided to be lazy and automate it, thus `github-label-maker` was born.

## Installation and use

To use this repository, clone it down locally, set up your shell environment, and run the scripts.

These scripts expect you to have a Github personal access token exported in your shell, under the name `GITHUBTOKEN`. That token should have `repo` access. For more information about creating a Github token, check out [their docs](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/).

Once the token is exported, you can run the scripts. There are two of them: `delete-labels` and `create-labels`. Their purposes are pretty self-explanatory, but it's important to note that you should run the `delete-labels` script **before** the `create-labels` one.

The `create-labels` script will take the contents of the `labels.json` file and create labels with those names and colors. If you need to change the labels you want to create, edit that file (or submit a PR to this repo that makes that configurable :)
