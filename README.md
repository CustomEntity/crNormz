<h1 align="center">
  <br>
  <a href="https://github.com/CustomEntity/crNormz"><img src="logo.png" alt="Markdownify" width="200"></a>
  <br>
  crNormz
  <br>
</h1>

<h4 align="center">The most awesome norminette made
using <a href="https://crystal-lang.org" target="_blank">Crystal</a>.</h4>

<p align="center">

<img alt="APM" src="https://img.shields.io/apm/l/vim-mode">
<img alt="GitHub issues" src="https://img.shields.io/github/issues/CustomEntity/crNormz?color=yellow">
<img alt="Discord" src="https://img.shields.io/discord/980113210881474672?color=blueviolet&label=discord">
<img alt="GitHub release" src="https://img.shields.io/github/v/release/CustomEntity/crNormz?color=yellow">
</p>

<p align="center">
  <a href="#project-description">Project Description</a> •
  <a href="#installation">Installation</a> •
  <a href="#how-to-use">How to use</a> •
  <a href="#features">Features</a> •
  <a href="#credits">Credits</a>
</p>


<p align="center">
  <img src="project.gif"  alt="project.gif"/>
</p>

## Project Description

crNormz is a norm checking program developed using Crystal so that students can check for compliance with the EPITECH standard. This standard is not yet the best but it is intended to be in the very near future.

## Installation

To clone and run this application, you'll need [Git](https://git-scm.com) installed on your computer. From your command line:

```bash
# Clone this repository
$ git clone https://github.com/CustomEntity/crNormz

# Go into the repository
$ cd crNormz

# Install the norminette
$ sudo ./cnormz_installer.sh

```

## How to use

```bash
# Show help
$ crnormz -h

Usage: crnormz [-fgtlh]
    -f, --ignore-file=               Ignore file from the checker
    -g, --ignore-function=           Ignore forbidden functions
    -t, --ignore-type=               Ignore errors of a specific type
    -l, --ignore-level=              Ignore errors of a specific level (Major, Minor or Info)
    -h, --help                       Show this help
    
# Run the norminette
$ crnormz
```