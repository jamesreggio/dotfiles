# dotfiles

...because I really don't want to use Sublime on your interviewing machine.

These work on recent versions of Max OS X and utilize [Ansible](https://www.ansible.com/)
for configuration automation.

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
