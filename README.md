# Save branches before delete them truely

If delete branch once, recovering that is very painful.
You have to trace Reflog mainly consist of hashsum.
Would you use trash-box? Using this command, the branch doesn't delete really and
appended "trash/" prefix.

## How to use

If you want to delete "branch-A",

~~~ sh
$ git trash-branch branch-A
~~~

Instead of deleting branch-A, this command move "branch-A" to "trash/branch-A".

If you want to restore branch-A, simply

~~~ sh
$ git branch -m trash/branch-A branch-A
~~~

When you decide to delete it completely,

~~~ sh
$ git -(d|D) trash/branch-A
~~~

By using zsh alias function, git branch command can list only not-trashed branches.
For more details, See [Installation](installation) section.

## Installation

1. Save git-trash-branch file to the directory specified in $PATH such as /usr/local/bin or ~/bin.

    ~~~ sh
    $ sudo curl -o /usr/local/bin/git-trash-branch https://raw2.github.com/bigwheel/git-trash-branch/master/git-trash-branch
    ~~~

2. Add Executable flag.

    ~~~ sh
    $ sudo chmod +x /usr/local/bin/git-trash-branch
    ~~~

3. If you are using zsh,
    1. Add zsh completion file.

        ~~~ sh
        $ sudo curl -o /usr/local/share/zsh/site-functions/_git-trash-branch https://raw2.github.com/bigwheel/git-trash-branch/master/zsh/_git-trash-branch
        ~~~

    2. Add alias command to filter "trash/XXX" branches from "git branch" result.
    
        ~~~ sh
        $ echo "alias gba=\"git branch --color -a | grep --color=never -v ' trash/'\"" >> ~/.zshrc
        ~~~
