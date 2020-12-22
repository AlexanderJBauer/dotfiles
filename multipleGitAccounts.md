Create SSH keys for all accounts
```
$ cd ~/.ssh
$ ssh-keygen -t rsa -C "ab@some.com" -f "github-some-username"
$ ssh-keygen -t rsa -C "ab@another.com" -f "github-another-username"
```

Add the SSH keys to SSH-agent
```
$ ssh-add -K ~/.ssh/github-some-username
$ ssh-add -K ~/.ssh/github-another-username
```

Import all the public keys on the corresponding GitHub accounts
```
$ pbcopy < ~/.ssh/github-some-username.pub
$ pbcopy < ~/.ssh/github-another-username.pub
```

Create GitHub host entries for all accounts
```
$ vim ~/.ssh/config
```
Add configs to file
```
#some-username account
Host github.com-some-username
    HostName github.com
    User git
    IdentityFile ~/.ssh/github-some-username

#another-username account
Host github.com-another-username
    HostName github.com
    User git
    IdentityFile ~/.ssh/github-another-username
```

Not yet cloned
```
$ git clone git@github.com-{your-username}:{the-repo-organisation-or-owner-user-name}/{the-repo-name}.git
```

Updating remote for repositories already cloned
```
$ git remote set-url origin git@github.com-{your-username}:{the-repo-organisation-or-owner-user-name}/{the-repo-name}.git
```

Last, in each repo, set user email and name
```
$ cd repo/using/some/account
$ git config user.email "ab@some.com"
$ git config user.name "some-username"

$ cd repo/using/another/account
$ git config user.email "ab@another.com"
$ git config user.name "another-username"
```

