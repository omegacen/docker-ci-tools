# gitlab-ci-tools

Various tools and utilities that come in handy during (GitLab) CI jobs.

List of tools installed:

  * git
  * openssh-client
  * rsync
  * s-nail
  * gettext  
  * curl
  * jq
  * black
  * autopep8
  * python-gitlab
  * python-compare-ast
  * coverage-fixpaths  
  * git-scripts
  * ssh-addkey

## git-scripts

Scripts that extend git and make some workflows easier. See
https://gitlab.astro-wise.org/omegacen/git-scripts.

## ssh-addkey

Easily add private SSH keys during your GitLab CI jobs.

This utility reduces the hassle of adding a private SSH key to running
Docker containers to one command. This is particularly useful for deploy 
jobs in GitLab CI, hence the name.

While running a container (interactively), you can add a private key as follows:
```
$ ssh-addkey "${SSH_PRIVATE_KEY}"
```
where the `SSH_PRIVATE_KEY` variable contains your private key. You can then
either ssh, rsync, or use git to sync to your favorite deploy server.
