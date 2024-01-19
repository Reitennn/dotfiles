# MacOS Awesome developer setup

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/reitennn/dotfiles/master/install.sh)"
```

## Login into gh

```bash
gh auth login --web
```

## Login to vscode with github

Go to vscode and click the profile icon in the bottom left corner. Then click "Sign in to Github" and follow the instructions.

## Check out tools

If you want to check out how to use the tools installed, you can use the man command or --help

Example:
Lets say i have never used git before and i want to know how to use it. I can then type `man git` or `git --help` to get a list of commands and how to use them.

Example 2: Lets say i want to know how to use the `ls` command. I can then type `man ls` or `ls --help` to get a list of commands and how to use them.

## Helpful commands to know

```bash
# List files in current directory
ls

# List files in current directory with more information
ls -la

# Change directory
cd <directory>

# Go back one directory
cd ..

# Go back to home directory
cd ~

# Make a directory
mkdir <directory>

# Make multiple directories at once down a path
mkdir -p <dir>/<dir>

# Remove a directory
rm -rf <directory>

# Remove a file
rm <file>

# Copy a file
cp <file> <new file>

# Copy a directory
cp -r <directory> <new directory>

# Move a file
mv <file> <new file>

# Move a directory
mv <directory> <new directory>

# Open a file in vscode
code <file>

# Open a directory in vscode
code <directory>
```
