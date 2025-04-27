# xcp

**xcp** is an enhanced alternative to the classic `cp` and `mv` commands, written in pure Bash.

It supports:
- **Progress bars** during file and directory operations
- **Recursive** copying with `-r` option
- **Move** functionality (copy and delete) with `-m` option
- Clean and simple command-line usage

Internally, `xcp` uses `pv` and `tar` to provide smooth progress visualization even for large files and directories.

## Features
- 📂 Copy files and directories with visual progress
- 🔄 Move files or directories with a single flag
- 📈 Clear progress bar during operations
- 📦 Lightweight `.deb` package available for easy installation

## Requirements
- Bash
- pv
- tar

## Installation
You can build and install it manually:

```bash
git clone https://github.com/dogukaneren/xcp
sudo cp xcp.sh /usr/local/bin/xcp
sudo chmod +x /usr/local/bin/xcp
