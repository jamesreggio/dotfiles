# dotfiles

...because I really don't want to use Sublime on your interviewing machine.

After going around the block with [YADR](https://github.com/skwp/dotfiles) and
[`oh-my-zsh`](https://github.com/robbyrussell/oh-my-zsh) &mdash; which require
you to subtract the things you don't want &mdash; I decided to return to the
simplicity of manually-compiled dotfiles. This collection configures `bash`,
`tmux`, and `vim` in a sensible way, with the [base16-tomorrow](https://github.com/chriskempson/base16)
theme across all three.

These dotfiles also capture my ideal Mac OS X configuration &mdash; insofar
that it can be automated &mdash; and make several OS X assumptions. They
utilize [Ansible](https://www.ansible.com/) for configuration automation.

## How to install

Consult [`manual.md`](manual.md) for pre- and post-flight manual activities, then
run:

```bash
curl -fsSL https://raw.githubusercontent.com/jamesreggio/dotfiles/master/bootstrap.sh | sh
```

## Thanks to...

* [YADR](https://github.com/skwp/dotfiles) for many valuable vim plugins
* [@brandonbloom](https://github.com/brandonbloom) for teaching me vim
* [@metcalf](https://github.com/metcalf) for the Ansible playbook and tasks
* [@jenanwise](https://github.com/jenanwise) for the [bootstrap](bootstrap.sh)
  script
