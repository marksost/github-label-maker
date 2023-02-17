# github-label-maker

A set of bash scripts for deleting / creating labels within Github

---

![label maker](https://media.giphy.com/media/PObhPDzNyKyaY/giphy.gif)

---

If you're like me, you create a bunch of Github repos all of the time. And if you're also like me, you work on a team of talented developers who expect a standard set of labels to be present with they're opening PRs. Up until now, I've been creating these manually. I finally decided to be lazy and automate it, thus `github-label-maker` was born.

## Installation and use

To use this repository, clone it down locally, set up your shell environment, and run the scripts.

These scripts expect you to have a Github personal access token exported in your shell, under the name `GITHUBTOKEN`. That token should have `repo` access. For more information about creating a Github token, check out [their docs](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/).

Once the token is exported, you can run the scripts. There are two of them: `delete-labels` and `create-labels`. Their purposes are pretty self-explanatory, but it's important to note that you should run the `delete-labels` script **before** the `create-labels` one.

The `create-labels` script will take the contents of the `labels.json` file by default and create labels with those names and colors. If you need to change the labels you want to create, edit that file or pass in a custom json file instead using the file name without the .json file extension.

## Examples

```
$ delete-labels -o marksost -r github-label-maker

Deleting labels for the following organization and repository:
  Organization: marksost
  Repository: github-label-maker
Getting labels for repository...
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  2794  100  2794    0     0  25789      0 --:--:-- --:--:-- --:--:-- 25870
Found 17 labels to delete...
Deleting labels from repository...
   Delete label: All Comments Addressed...
   Delete label: Do Not Merge...
   Delete label: Final Review Passed...
   Delete label: Has Dependencies...
   Delete label: Has Unaddressed Comments...
   Delete label: In Development...
   Delete label: In QA...
   Delete label: In Review...
   Delete label: Initial Review Passed...
   Delete label: Needs Final Review...
   Delete label: Needs Rebase...
   Delete label: Pending CI...
   Delete label: QA Failed...
   Delete label: QA Passed...
   Delete label: Ready for QA...
   Delete label: Ready for Review...
   Delete label: Tests Failing...
Labels deleted successfully!

$ create-labels -o marksost -r github-label-maker

Creating labels for the following organization and repository:
  Organization: marksost
  Repository: github-label-maker
  Creating label with the following settings:
    Name: All Comments Addressed
    Color: 006b75
{"id":858305072,"url":"https://api.github.com/repos/marksost/github-label-maker/labels/All%20Comments%20Addressed","name":"All Comments Addressed","color":"006b75","default":false}

...snip...

  Creating label with the following settings:
    Name: Tests Failing
    Color: b60205
{"id":858305121,"url":"https://api.github.com/repos/marksost/github-label-maker/labels/Tests%20Failing","name":"Tests Failing","color":"b60205","default":false}
Labels created successfully!

$ create-labels -o marksost -r github-label-maker -l my-custom-labels

Creating labels for the following organization and repository:
  Organization: marksost
  Repository: github-label-maker
  Label file: my-custom-labels.json
  Creating label with the following settings:
    Name: Needs Code Review
    Color: ed7568
{
  "id": 5166120798,
  "node_id": "LA_kwDOI_Bh3M8AAAABM-y_Xg",
  "url": "https://api.github.com/repos/marksost/github-label-maker/labels/Needs%20Code%20Review",
  "name": "Needs Code Review",
  "color": "ed7568",
  "default": false,
  "description": null
}

Labels created successfully!
```
