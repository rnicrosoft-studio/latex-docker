# latex-docker
🐳 Docker Image of TeXLive based on Ubuntu

# Usage
```sh
docker pull ghcr.io/rnicrosoft-studio/latex:<TAG>
```

# Supported tags
`<YEAR>-<SCHEME>-<VARIANT>`

|  | Default |
| -- | -- |
| `<YEAR>` | latest / 2024 |
| `<SCHEME>` | full |
| `<VARIANT>` | jammy |


* `main` `jammy`
    * `latest` `latest-jammy`
    * `2024` `2024-jammy`
* `full` `full-jammy`
    * `latest-full` `latest-full-jammy`
    * `2024-full` `2024-full-jammy`
* `medium` `medium-jammy`
    * `latest-medium` `latest-medium-jammy`
    * `2024-medium` `2024-medium-jammy` 
* `small` `small-jammy`
    * `latest-small` `latest-small-jammy`
    * `2024-small` `2024-small-jammy`
* `basic` `basic-jammy`
    * `latest-basic` `latest-basic-jammy`
    * `2024-basic` `2024-basic-jammy`
* `minimal` `minimal-jammy`
    * `latest-minimal` `latest-minimal-jammy`
    * `2024-minimal` `2024-minimal-jammy`
* `infraonly` `infraonly-jammy`
    * `latest-infraonly` `latest-infraonly-jammy`
    * `2024-infraonly` `2024-infraonly-jammy`

# Notice

DO NOT leave LaTeX source files on Windows disk and use this image with WSL to compile!
I/O performance on mounted drive is [extremely bad](https://learn.microsoft.com/en-us/windows/wsl/filesystems#file-storage-and-performance-across-file-systems).

For the reference, here is the compilation benchmark of [a 50 pages PDF](https://github.com/sjtug/SJTUThesis) with different methods on the same computer:

## Source in Windows with WSL devcontainer

```
Latexmk: All targets (main.xdv main.pdf) are up-to-date
'xelatex': time = 6.64
'biber main': time = 2.33
'xelatex': time = 6.49
'xelatex': time = 6.38
'xdvipdfmx': time = 0.82
Processing time = 23.93, of which invoked processes = 22.66, other = 1.27.
Elapsed clock time = 105.81.  <=====
Number of rules run = 5
```

## Source in Windows with Compile.bat

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
Elapsed clock time = 22.07.  <=====
Number of rules run = 5
```

## Source in WSL with WSL devcontainer

```
Latexmk: All targets (main.xdv main.pdf) are up-to-date
'xelatex': time = 4.87
'biber main': time = 2.11
'xelatex': time = 4.90
'xelatex': time = 4.79
'xdvipdfmx': time = 0.71
Processing time = 18.52, of which invoked processes = 17.38, other = 1.14.
Elapsed clock time = 18.53.  <=====
Number of rules run = 5
```
