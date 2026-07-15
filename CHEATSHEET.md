# Cheatsheet

Every command here is meant to be copy-pasted into your terminal. Sections are numbered to match the workshop flow, so if you get lost, ask a facilitator which section we are on.

## 1. Am I ready?

Open the terminal panel and run:

```bash
fastfetch
```

You should see a small logo and some system info. If you do not have a terminal open, use the menu (the hamburger icon, top left) then Terminal then New Terminal.

If fastfetch says command not found, run neofetch instead. That means the backup tool was installed and you are fine to continue.

## 2. Terminal fundamentals

A few commands you will use constantly.

- `pwd` prints the folder you are currently in.
- `ls` lists what is in the current folder.
- `cd` changes folder. `cd ..` goes up one level.
- `cat` prints a file's contents to the screen.
- `mkdir` makes a new folder.
- `touch` makes a new empty file.

Try this sequence as a mini playground:

```bash
mkdir ~/playground
cd ~/playground
touch notes.txt
ls
cat notes.txt
cd /workspaces/linux-docker-workshop
```

`cat` on an empty file prints nothing, which is correct, there is nothing in it yet. That last line returns you to the workshop project folder, you can come back to the playground any time with `cd ~/playground`.

Nano basics, for when you want to edit a file from the terminal instead of the file browser:

```bash
nano ~/playground/notes.txt
```

Type something, then press Ctrl+O then Enter to save, then Ctrl+X to exit.

## 3. Change your prompt

Paste this single line into your terminal:

```bash
export PS1="\[\e[1;35m\]\u\[\e[0m\] \[\e[1;36m\]\w\[\e[0m\] $ "
```

Your prompt just changed color. This only lasts for this terminal session though, close it and it is gone. To make it permanent, append the same line to your `~/.bashrc` file so it runs every time a terminal opens.

## 4. Dotfiles

Apply the workshop's ready-made prompt and aliases:

```bash
cd /workspaces/linux-docker-workshop
cat dotfiles/bashrc-extras.sh >> ~/.bashrc && source ~/.bashrc
```

Apply the fastfetch config:

```bash
mkdir -p ~/.config/fastfetch && cp dotfiles/fastfetch-config.jsonc ~/.config/fastfetch/config.jsonc
```

This is exactly what a rice is: config files in a repo that reproduce someone's setup.

## 5. Docker first contact

Run your first container:

```bash
docker run hello-world
```

Now run a real web server:

```bash
docker run -d -p 8080:80 nginx:alpine
```

A Ports tab appears next to the Terminal tab. Find port 8080 there and click the globe icon to open it (it may also open a preview automatically). See it running with:

```bash
docker ps
```

Stop it with the first few characters of its container id:

```bash
docker stop <id>
```

## 6. Build your own image

```bash
cd /workspaces/linux-docker-workshop/myapp
```

Open `index.html` in the editor and change something. Then build and run your image:

```bash
docker build -t myapp .
docker run -d -p 8080:80 myapp
```

Refresh the preview tab to see your change.

To rebuild after another edit, stop the old container first:

```bash
docker ps
docker stop <id>
```

Then build and run again with the same two commands above.

## 7. You cannot break anything

If your codespace ever gets weird, go to github.com/codespaces, delete it, and create a new one. Everything in this repo comes back exactly as it was. Anything you personally created or edited in the codespace, your playground files, your index.html edits, is gone though, so keep anything you want to save somewhere else first.

## 8. Bonus: a whole desktop in a container

At the end of the session you will open a second codespace that runs a full Linux desktop in your browser.

1. Open the repo in a new browser tab and switch the branch dropdown from main to ubuntu-desktop.
2. Click the green Code button, pick the Codespaces tab, and create a codespace on ubuntu-desktop. Pick the 4-core machine if it asks.
3. It takes a few minutes to build. Go back to what you were doing and check on it later.
4. When it is ready, open the Ports tab, find port 3000 (Linux desktop (KDE)), and click the globe icon.
5. Give it up to a minute, then you are looking at a complete Linux desktop, running inside a container.

If the picture looks blurry or laggy, open the side panel (the small arrow tab on the left edge of the desktop page) and lower the stream quality, or just watch the projector.

When you are done, stop or delete this codespace at github.com/codespaces. The 4-core machine uses your free quota faster than the main one.
