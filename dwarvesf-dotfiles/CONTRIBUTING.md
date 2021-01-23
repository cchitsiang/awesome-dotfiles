# How to contribute

### Open Development

All work on the project happens directly on GitHub. Both core team members and external contributors send pull requests which go through the same review process.

### Bugs

#### Where to Find Known Issues

We are using GitHub Issues for our public bugs. We keep a close eye on this and try to make it clear when we have an internal fix in progress. Before filing a new task, try to make sure your problem doesn't already exist.

#### Reporting New Issues

The best way to get your bug fixed is to provide a reduced test case. This [issue template](http://github.com/dwarvesf/dotfiles/issues/new) is a great starting point.

### How to get in touch

- If you are a miner, please report to your senior miner.
- Or please send email to developer@dwarvesf.com in case you need help from Dwarves Foundation.

### Proposing a Change

If you intend to change the public API, or make any non-trivial changes to the implementation, we recommend filing an issue. This lets us reach an agreement on your proposal before you put significant effort into it.

If you're only fixing a bug, it's fine to submit a pull request right away but we still recommend to file an issue detailing what you're fixing. This is helpful in case we don't accept that specific fix but want to keep track of the issue.

### Your First Pull Request

Working on your first Pull Request? You can learn how from this free video series:

[How to Contribute to an Open Source Project on GitHub](https://egghead.io/courses/how-to-contribute-to-an-open-source-project-on-github)

If you decide to fix an issue, please be sure to check the comment thread in case somebody is already working on a fix. If nobody is working on it at the moment, please leave a comment stating that you intend to work on it so other people don't accidentally duplicate your effort.

If somebody claims an issue but doesn't follow up for more than two weeks, it's fine to take over it but you should still leave a comment.

### Sending a Pull Request

The core team is monitoring for pull requests. We will review your pull request and either merge it, request changes to it, or close it with an explanation. We may need to fix our internal uses at [Dwarves Foundation](d.foundation), which could cause some delay. We'll do our best to provide updates and feedback throughout the process.

Before submitting a pull request, please make sure the following is done:

  1. Fork the repository and create your branch from master.
  2. If you've added code that should be tested, add tests!
  3. If you've changed APIs, update the documentation.
  4. Ensure the test suite passes.
  5. Make sure your code lints.

### Contribution Prerequisites

You need to setup a fresh virtual machine to test the dotfiles

- Install [Vagrant](https://docs.vagrantup.com/v2/installation/)
- Install [Mac OS X Vagrant box for VirtualBox](https://github.com/AndrewDryga/vagrant-box-osx)

### Development Workflow

- Fork this repo and clone to your machine
- Make some improvements and test them using Vagrant
- Submit pull request

### License

By contributing to this [dwarvesf/dotfiles](https://github.com/dwarvesf/dotfiles), you agree that your contributions will be licensed under its Apache license.