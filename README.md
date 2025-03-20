# latex-docker
🐳 Docker Image of TeXLive based on Ubuntu

# Usage
```sh
docker pull ghcr.io/rnicrosoft-studio/latex:<TAG>
```

# Supported tags
`<YEAR>-<SCHEME>-<VARIANT>`

|  | Default | Options |
| -- | -- | -- |
| `<YEAR>` | latest / 2024 | latest, 2024, 2023 |
| `<SCHEME>` | full | full, medium, small, basic, minimal, infraonly |
| `<VARIANT>` | jammy | noble, jammy |


* 2024
    * 2024-noble
        * `2024-full-noble`
            * `latest-noble` `latest-full-noble`
            * `2024` `noble`
            * `2024-noble` `full-noble`
        * `2024-medium-noble`
            * `latest-medium-noble`
            * `medium-noble`
        * `2024-small-noble`
            * `latest-small-noble`
            * `small-noble`
        * `2024-basic-noble`
            * `latest-basic-noble`
            * `basic-noble`
        * `2024-minimal-noble`
            * `latest-minimal-noble`
            * `minimal-noble`
        * `2024-infraonly-noble`
            * `latest-infraonly-noble`
            * `infraonly-noble`
    * 2024-jammy
        * `2024-full-jammy`
            * `latest` `latest-full` `latest-jammy` `latest-full-jammy`
            * `2024` `full` `jammy`
            * `2024-full` `2024-jammy` `full-jammy`
        * `2024-medium-jammy`
            * `latest-medium` `latest-medium-jammy`
            * `2024-medium` `medium-jammy`
        * `2024-small-jammy`
            * `latest-small` `latest-small-jammy`
            * `2024-small` `small-jammy`
        * `2024-basic-jammy`
            * `latest-basic` `latest-basic-jammy`
            * `2024-basic` `basic-jammy`
        * `2024-minimal-jammy`
            * `latest-minimal` `latest-minimal-jammy`
            * `2024-minimal` `minimal-jammy`
        * `2024-infraonly-jammy`
            * `latest-infraonly` `latest-infraonly-jammy`
            * `2024-infraonly` `infraonly-jammy`
* 2023
    * 2023-jammy
        * `2023-full-jammy`
            * `2023`
            * `2023-full` `2023-jammy`
        * `2023-medium-jammy`
            * `2023-medium`
        * `2023-small-jammy`
            * `2023-small`
        * `2023-basic-jammy`
            * `2023-basic`
        * `2023-minimal-jammy`
            * `2023-minimal`
        * `2023-infraonly-jammy`
            * `2023-infraonly`

# Notice

DO NOT leave LaTeX source files on Windows disk and use this image with WSL to compile!
I/O performance on mounted drive is [extremely bad](https://learn.microsoft.com/en-us/windows/wsl/filesystems#file-storage-and-performance-across-file-systems).

For the reference, here is a compilation benchmark of [a 50 pages PDF](https://github.com/sjtug/SJTUThesis) with different methods on the same computer:

<details>
<summary>Source in Windows filesystem, use LaTex compiler in this image with WSL devcontainer: 105.81 s</summary>
   
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
<summary>Source in Windows filesystem, use LaTex compiler in Windows: 22.07 s</summary>

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
<summary>Source in WSL filesystem, use LaTex compiler in this image with WSL devcontainer: 18.53 s</summary>

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
