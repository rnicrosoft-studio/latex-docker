# latex-docker
[![Build (latest)](https://github.com/rnicrosoft-studio/latex-docker/actions/workflows/docker-publish-latest.yml/badge.svg)](https://github.com/rnicrosoft-studio/latex-docker/actions/workflows/docker-publish-latest.yml)

🐳 Docker Image of TeXLive based on Ubuntu, both latest (monthly automatically updated) and historical versions.

Save the long night from the installation of thousands of TeXLive packages!

# Usage
```sh
docker pull ghcr.io/rnicrosoft-studio/latex:<TAG>
```

# Supported tags
* `latest`: latest TeXLive version on `full` scheme. Ubuntu variant can not be specified, but also often the latest.
* `<YEAR>-<SCHEME>-<VARIANT>`: TeXLive `<YEAR>` (YYYY) version on `<SCHEME>` scheme based on Ubuntu `<VARIANT>`.
   * `<YEAR>`
   * `<SCHEME>`
   * `<VARIANT>`
   * `<YEAR>-<SCHEME>`
   * `<YEAR>-<VARIANT>`
   * `<SCHEME>-<VARIANT>`

|  | Default | Options |
| -- | -- | -- |
| `<YEAR>` | latest | latest, YYYY |
| `<SCHEME>` | full | [full, medium, small, basic, minimal, infraonly](https://tug.org/texlive/doc/texlive-en/texlive-en.html#x1-24027r6) |
| `<VARIANT>` | noble | [noble (24.04 LTS), jammy (22.04 LTS)](https://wiki.ubuntu.com/Releases) |

* `<COMPILATION_TIME>`: historical TeXLive version on `full` scheme when `<COMPILATION_TIME>` (YYYYMM). Ubuntu variant can not be specified.

For the whole list of supported tags, see [this page](https://github.com/rnicrosoft-studio/latex-docker/pkgs/container/latex/versions?filters%5Bversion_type%5D=tagged).

# Notice

DO NOT leave LaTeX source files in Windows filesystem and use this image with WSL to compile!
I/O performance on mounted drive is [extremely bad](https://learn.microsoft.com/en-us/windows/wsl/filesystems#file-storage-and-performance-across-file-systems).

For the reference, here is a compilation benchmark of [a 50 pages PDF](https://github.com/sjtug/SJTUThesis) with different methods on the same computer:

<details>
<summary>Source in Windows filesystem, use this image with WSL devcontainer: 105.81 s 🚫</summary>
   
```
Latexmk: All targets (main.xdv main.pdf) are up-to-date
'xelatex': time = 6.64
'biber main': time = 2.33
'xelatex': time = 6.49
'xelatex': time = 6.38
'xdvipdfmx': time = 0.82
Processing time = 23.93, of which invoked processes = 22.66, other = 1.27.
Elapsed clock time = 105.81.  <==========
Number of rules run = 5
```
</details>

<details>
<summary>Source in Windows filesystem, use Windows LaTex compiler: 22.07 s 👎</summary>

```
SyncTeX written on main.synctex.gz.
Latexmk: Getting log file 'main.log'
Latexmk: Run number 1 of rule 'xdvipdfmx'
'xelatex': time = 5.10
'biber main': time = 2.98
'xelatex': time = 5.33
'xelatex': time = 5.23
'xdvipdfmx': time = 1.47
Processing time = 22.07, of which invoked processes = 20.11, other = 1.96.
Elapsed clock time = 22.07.  <==========
Number of rules run = 5
```
</details>

<details>
<summary>Source in WSL filesystem, use this image with WSL devcontainer: 18.53 s ✨</summary>

```
Latexmk: All targets (main.xdv main.pdf) are up-to-date
'xelatex': time = 4.87
'biber main': time = 2.11
'xelatex': time = 4.90
'xelatex': time = 4.79
'xdvipdfmx': time = 0.71
Processing time = 18.52, of which invoked processes = 17.38, other = 1.14.
Elapsed clock time = 18.53.  <==========
Number of rules run = 5
```
</details>
