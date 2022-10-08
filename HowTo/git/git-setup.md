###Howtos: git basics
###Kanotix_Guide
###Sun Aug 31 23:46:15 EST 2014
---

0. Commands to setup git.

Set up Editor used by git

```
git config --global core.editor "edit -w"
git config --global core.editor "nvim"
```

1. Set up globals
Committer: ombault <XXXt@localhost>
Your name and email address were configured automatically based
on your username and hostname. Please check that they are accurate.
You can suppress this message by setting them explicitly. Run the
following command and follow the instructions in your editor to edit
your configuration file:

    git config --global --edit

After doing this, you may fix the identity used for this commit with:

    git commit --amend --reset-author

2. 

```
hint: Pulling without specifying how to reconcile divergent branches is
hint: discouraged. You can squelch this message by running one of the following
hint: commands sometime before your next pull:
hint: 
hint:   git config pull.rebase false  # merge (the default strategy)
hint:   git config pull.rebase true   # rebase
hint:   git config pull.ff only       # fast-forward only
hint: 
hint: You can replace "git config" with "git config --global" to set a default
hint: preference for all repositories. You can also pass --rebase, --no-rebase,
hint: or --ff-only on the command line to override the configured default per
hint: invocation.
Warning: Permanently a
```
then

```
git config --global pull.rebase false

```


