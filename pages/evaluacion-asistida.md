---
toc: true
---

### Comprobando la asistencia y participación de los alumnos via los commits

1. Abrimos  una nueva ventana en el navegador
2. `gh org-browse-repo -CS static -P 25`


### Creando un super-repo con todos los repos de la práctica:
 
```
gh submodule-add -n -s markdown ULL-MFP-AET-2122
gh submodule-add ULL-MFP-AET-2122 -s markdown
```

### Determinando quien va mas avanzado en la tarea

```
git submodule foreach 'wc README.md'
```

or, if you are a really nerd hacker:

```
git submodule foreach 'wc README.md ' | xargs -n 6 | sort -gk 3
```

### Abriendo pestañas en cada uno de los proyectos de los alumnos.

Abrimos primero una nueva ventana en el navegador por defecto y ...

```
git submodule foreach 'gh browse'
```

### Generando incidencias con los fallos la práctica 

Usamos un programa que haga un diagnóstico de la calidad del trabajo:

Instalamos una herramienta adecuada:

```
npm install -g markdownlint-cli
```

Generamos los informes:

```
$ git submodule foreach 'markdownlint README.md -o issues.txt || :'
```

y creamos las incidencias:

```
$ git submodule foreach 'gh issue create -F issues.txt'
```

### Visitando todas las páginas de profile de los alumnos en 10 minutos

```
➜  github-profile-readme gh org-members ULL-MFP-AET-2122
AdelaGM
Alex100260076
alu0100108859
alu0100879902
alu0100948387
alu0100951844
amarrerod
AnabelCP
casiano
CGuerra2021
ChloeBoistel
crguezl
ivan-ga
Jaimetaks
Juacabga87
magodelnorte
ManCurTru
NoeliaRguezHdez
Ramallin
```

```
➜  github-profile-readme gh org-members ULL-MFP-AET-2122 | sed -ne 's#^#https://github.com/#p'
https://github.com/AdelaGM
https://github.com/Alex100260076
https://github.com/alu0100108859
https://github.com/alu0100879902
https://github.com/alu0100948387
https://github.com/alu0100951844
https://github.com/amarrerod
https://github.com/AnabelCP
https://github.com/casiano
https://github.com/CGuerra2021
https://github.com/ChloeBoistel
https://github.com/crguezl
https://github.com/ivan-ga
https://github.com/Jaimetaks
https://github.com/Juacabga87
https://github.com/magodelnorte
https://github.com/ManCurTru
https://github.com/NoeliaRguezHdez
https://github.com/Ramallin
```

```
➜  github-profile-readme gh org-members ULL-MFP-AET-2122 --jq '.[].login' | sed -ne 's#^#https://github.com/#p' > profiles-urls
```

```
➜  github-profile-readme # abro nueva ventana en el navegador ...
➜  github-profile-readme xargs open < profiles-urls
```

## Nº de commits etc.

Véase  [gh-cli-for-education/git-developer-contribution-analysis](https://github.com/gh-cli-for-education/git-developer-contribution-analysis)

Thanks for the utility @bloombar @jayamundra! 👍 

I'll be using it in future courses!

When using the command:

```
./git-analysis.py -rf REPOFILE -f json > markdown-aet.jso
```

with `REPOFILE` having these contents:

``` 
https://github.com/ULL-MFP-AET-2122/aprender-markdown-adela-gonzalez-maury-alu0101116204.git
https://github.com/ULL-MFP-AET-2122/aprender-markdown-adela-gonzalez-maury-alu0101116204.git
https://github.com/ULL-MFP-AET-2122/aprender-markdown-adrian-prieto-curbelo_alu0100948387.git
https://github.com/ULL-MFP-AET-2122/aprender-markdown-adrian-prieto-curbelo_alu0100948387.git
https://github.com/ULL-MFP-AET-2122/aprender-markdown-alejandro-gonzalez-sarasola-alu0100260076.git
https://github.com/ULL-MFP-AET-2122/aprender-markdown-alejandro-gonzalez-sarasola-alu0100260076.git
https://github.com/ULL-MFP-AET-2122/aprender-markdown-alejandro-marrero-diaz-alu100825008.git
https://github.com/ULL-MFP-AET-2122/aprender-markdown-alejandro-marrero-diaz-alu100825008.git
https://github.com/ULL-MFP-AET-2122/aprender-markdown-anabel-coello-perez-alu0100885200.git
https://github.com/ULL-MFP-AET-2122/aprender-markdown-anabel-coello-perez-alu0100885200.git
https://github.com/ULL-MFP-AET-2122/aprender-markdown-angel-ramallobenitez-alu0100312898.git
https://github.com/ULL-MFP-AET-2122/aprender-markdown-angel-ramallobenitez-alu0100312898.git
https://github.com/ULL-MFP-AET-2122/aprender-markdown-carlos-guerra-olivera-alu0100703535.git
https://github.com/ULL-MFP-AET-2122/aprender-markdown-carlos-guerra-olivera-alu0100703535.git
https://github.com/ULL-MFP-AET-2122/aprender-markdown-chloe-boistel-perez-alu0100788020.git
https://github.com/ULL-MFP-AET-2122/aprender-markdown-chloe-boistel-perez-alu0100788020.git
https://github.com/ULL-MFP-AET-2122/aprender-markdown-ivan-gonzalez-aguiar-alu0100551266.git
https://github.com/ULL-MFP-AET-2122/aprender-markdown-ivan-gonzalez-aguiar-alu0100551266.git
https://github.com/ULL-MFP-AET-2122/aprender-markdown-jaime-garcia-bullejos-alu0100906806.git
https://github.com/ULL-MFP-AET-2122/aprender-markdown-jaime-garcia-bullejos-alu0100906806.git
https://github.com/ULL-MFP-AET-2122/aprender-markdown-manuel_curbelo_alu0100045130.git
https://github.com/ULL-MFP-AET-2122/aprender-markdown-manuel_curbelo_alu0100045130.git
https://github.com/ULL-MFP-AET-2122/aprender-markdown-nestor-gonzalez-lopez-alu0100108859.git
https://github.com/ULL-MFP-AET-2122/aprender-markdown-nestor-gonzalez-lopez-alu0100108859.git
https://github.com/ULL-MFP-AET-2122/aprender-markdown-noelia-rodriguez-hernandez-alu0100595420.git
https://github.com/ULL-MFP-AET-2122/aprender-markdown-noelia-rodriguez-hernandez-alu0100595420.git
https://github.com/ULL-MFP-AET-2122/aprender-markdown-wim-van-hoye-alu0101520377.git
https://github.com/ULL-MFP-AET-2122/aprender-markdown-wim-van-hoye-alu0101520377.git
https://github.com/ULL-MFP-AET-2122/aprender-markdown-yeray_exposito_garcia_alu0100951844.git
https://github.com/ULL-MFP-AET-2122/aprender-markdown-yeray_exposito_garcia_alu0100951844.git
```

it produces this output. Commas are missed among repos reports:

```json
[
    {
        "username": "github-classroom[bot]",
        "repository": "aprender-markdown-adela-gonzalez-maury-alu0101116204",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 0,
        "insertions": 0,
        "deletions": 0,
        "files": 0
    },
    {
        "username": "AdelaGM",
        "repository": "aprender-markdown-adela-gonzalez-maury-alu0101116204",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 15,
        "insertions": 80,
        "deletions": 29,
        "files": 12
    }
]
[
    {
        "username": "github-classroom[bot]",
        "repository": "aprender-markdown-adela-gonzalez-maury-alu0101116204",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 0,
        "insertions": 0,
        "deletions": 0,
        "files": 0
    },
    {
        "username": "AdelaGM",
        "repository": "aprender-markdown-adela-gonzalez-maury-alu0101116204",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 15,
        "insertions": 80,
        "deletions": 29,
        "files": 12
    }
]
[
    {
        "username": "github-classroom[bot]",
        "repository": "aprender-markdown-adrian-prieto-curbelo_alu0100948387",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 0,
        "insertions": 0,
        "deletions": 0,
        "files": 0
    },
    {
        "username": "alu0100948387",
        "repository": "aprender-markdown-adrian-prieto-curbelo_alu0100948387",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 4,
        "insertions": 22,
        "deletions": 6,
        "files": 3
    }
]
[
    {
        "username": "github-classroom[bot]",
        "repository": "aprender-markdown-adrian-prieto-curbelo_alu0100948387",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 0,
        "insertions": 0,
        "deletions": 0,
        "files": 0
    },
    {
        "username": "alu0100948387",
        "repository": "aprender-markdown-adrian-prieto-curbelo_alu0100948387",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 4,
        "insertions": 22,
        "deletions": 6,
        "files": 3
    }
]
[
    {
        "username": "Alex100260076",
        "repository": "aprender-markdown-alejandro-gonzalez-sarasola-alu0100260076",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 1,
        "commits": 25,
        "insertions": 95,
        "deletions": 53,
        "files": 16
    },
    {
        "username": "Casiano Rodriguez-Leon",
        "repository": "aprender-markdown-alejandro-gonzalez-sarasola-alu0100260076",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 1,
        "insertions": 0,
        "deletions": 0,
        "files": 0
    },
    {
        "username": "Alejandro Glez. Sarasola",
        "repository": "aprender-markdown-alejandro-gonzalez-sarasola-alu0100260076",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 3,
        "insertions": 2,
        "deletions": 3,
        "files": 2
    }
]
[
    {
        "username": "Alex100260076",
        "repository": "aprender-markdown-alejandro-gonzalez-sarasola-alu0100260076",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 1,
        "commits": 25,
        "insertions": 95,
        "deletions": 53,
        "files": 16
    },
    {
        "username": "Casiano Rodriguez-Leon",
        "repository": "aprender-markdown-alejandro-gonzalez-sarasola-alu0100260076",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 1,
        "insertions": 0,
        "deletions": 0,
        "files": 0
    },
    {
        "username": "Alejandro Glez. Sarasola",
        "repository": "aprender-markdown-alejandro-gonzalez-sarasola-alu0100260076",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 3,
        "insertions": 2,
        "deletions": 3,
        "files": 2
    }
]
[
    {
        "username": "github-classroom[bot]",
        "repository": "aprender-markdown-alejandro-marrero-diaz-alu100825008",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 0,
        "insertions": 0,
        "deletions": 0,
        "files": 0
    },
    {
        "username": "amarrerod",
        "repository": "aprender-markdown-alejandro-marrero-diaz-alu100825008",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 14,
        "insertions": 18,
        "deletions": 6,
        "files": 7
    },
    {
        "username": "Alejandro Marrero",
        "repository": "aprender-markdown-alejandro-marrero-diaz-alu100825008",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 2,
        "insertions": 13,
        "deletions": 8,
        "files": 10
    }
]
[
    {
        "username": "github-classroom[bot]",
        "repository": "aprender-markdown-alejandro-marrero-diaz-alu100825008",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 0,
        "insertions": 0,
        "deletions": 0,
        "files": 0
    },
    {
        "username": "amarrerod",
        "repository": "aprender-markdown-alejandro-marrero-diaz-alu100825008",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 14,
        "insertions": 18,
        "deletions": 6,
        "files": 7
    },
    {
        "username": "Alejandro Marrero",
        "repository": "aprender-markdown-alejandro-marrero-diaz-alu100825008",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 2,
        "insertions": 13,
        "deletions": 8,
        "files": 10
    }
]
[
    {
        "username": "AnabelCP",
        "repository": "aprender-markdown-anabel-coello-perez-alu0100885200",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 2,
        "commits": 40,
        "insertions": 95,
        "deletions": 59,
        "files": 29
    },
    {
        "username": "github-classroom[bot]",
        "repository": "aprender-markdown-anabel-coello-perez-alu0100885200",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 0,
        "insertions": 0,
        "deletions": 0,
        "files": 0
    },
    {
        "username": "Casiano Rodriguez-Leon",
        "repository": "aprender-markdown-anabel-coello-perez-alu0100885200",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 1,
        "commits": 3,
        "insertions": 3,
        "deletions": 1,
        "files": 1
    }
]
[
    {
        "username": "AnabelCP",
        "repository": "aprender-markdown-anabel-coello-perez-alu0100885200",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 2,
        "commits": 40,
        "insertions": 95,
        "deletions": 59,
        "files": 29
    },
    {
        "username": "github-classroom[bot]",
        "repository": "aprender-markdown-anabel-coello-perez-alu0100885200",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 0,
        "insertions": 0,
        "deletions": 0,
        "files": 0
    },
    {
        "username": "Casiano Rodriguez-Leon",
        "repository": "aprender-markdown-anabel-coello-perez-alu0100885200",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 1,
        "commits": 3,
        "insertions": 3,
        "deletions": 1,
        "files": 1
    }
]
[
    {
        "username": "\u00c1ngel Ramallo Ben\u00edtez",
        "repository": "aprender-markdown-angel-ramallobenitez-alu0100312898",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 1,
        "insertions": 0,
        "deletions": 0,
        "files": 0
    },
    {
        "username": "github-classroom[bot]",
        "repository": "aprender-markdown-angel-ramallobenitez-alu0100312898",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 0,
        "insertions": 0,
        "deletions": 0,
        "files": 0
    },
    {
        "username": "Angel Ramallo",
        "repository": "aprender-markdown-angel-ramallobenitez-alu0100312898",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 10,
        "insertions": 3,
        "deletions": 2,
        "files": 2
    }
]
[
    {
        "username": "\u00c1ngel Ramallo Ben\u00edtez",
        "repository": "aprender-markdown-angel-ramallobenitez-alu0100312898",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 1,
        "insertions": 0,
        "deletions": 0,
        "files": 0
    },
    {
        "username": "github-classroom[bot]",
        "repository": "aprender-markdown-angel-ramallobenitez-alu0100312898",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 0,
        "insertions": 0,
        "deletions": 0,
        "files": 0
    },
    {
        "username": "Angel Ramallo",
        "repository": "aprender-markdown-angel-ramallobenitez-alu0100312898",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 10,
        "insertions": 3,
        "deletions": 2,
        "files": 2
    }
]
[
    {
        "username": "github-classroom[bot]",
        "repository": "aprender-markdown-carlos-guerra-olivera-alu0100703535",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 0,
        "insertions": 0,
        "deletions": 0,
        "files": 0
    },
    {
        "username": "CGuerra2021",
        "repository": "aprender-markdown-carlos-guerra-olivera-alu0100703535",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 17,
        "insertions": 43,
        "deletions": 29,
        "files": 8
    }
]
[
    {
        "username": "github-classroom[bot]",
        "repository": "aprender-markdown-carlos-guerra-olivera-alu0100703535",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 0,
        "insertions": 0,
        "deletions": 0,
        "files": 0
    },
    {
        "username": "CGuerra2021",
        "repository": "aprender-markdown-carlos-guerra-olivera-alu0100703535",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 17,
        "insertions": 43,
        "deletions": 29,
        "files": 8
    }
]
[
    {
        "username": "github-classroom[bot]",
        "repository": "aprender-markdown-chloe-boistel-perez-alu0100788020",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 0,
        "insertions": 0,
        "deletions": 0,
        "files": 0
    },
    {
        "username": "ChloeBoistel",
        "repository": "aprender-markdown-chloe-boistel-perez-alu0100788020",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 41,
        "insertions": 84,
        "deletions": 69,
        "files": 24
    }
]
[
    {
        "username": "github-classroom[bot]",
        "repository": "aprender-markdown-chloe-boistel-perez-alu0100788020",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 0,
        "insertions": 0,
        "deletions": 0,
        "files": 0
    },
    {
        "username": "ChloeBoistel",
        "repository": "aprender-markdown-chloe-boistel-perez-alu0100788020",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 41,
        "insertions": 84,
        "deletions": 69,
        "files": 24
    }
]
[
    {
        "username": "github-classroom[bot]",
        "repository": "aprender-markdown-ivan-gonzalez-aguiar-alu0100551266",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 0,
        "insertions": 0,
        "deletions": 0,
        "files": 0
    },
    {
        "username": "Iv\u00e1n Gonz\u00e1lez",
        "repository": "aprender-markdown-ivan-gonzalez-aguiar-alu0100551266",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 10,
        "insertions": 27,
        "deletions": 13,
        "files": 10
    }
]
[
    {
        "username": "github-classroom[bot]",
        "repository": "aprender-markdown-ivan-gonzalez-aguiar-alu0100551266",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 0,
        "insertions": 0,
        "deletions": 0,
        "files": 0
    },
    {
        "username": "Iv\u00e1n Gonz\u00e1lez",
        "repository": "aprender-markdown-ivan-gonzalez-aguiar-alu0100551266",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 10,
        "insertions": 27,
        "deletions": 13,
        "files": 10
    }
]
[
    {
        "username": "github-classroom[bot]",
        "repository": "aprender-markdown-jaime-garcia-bullejos-alu0100906806",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 0,
        "insertions": 0,
        "deletions": 0,
        "files": 0
    },
    {
        "username": "Jaime Garc\u00eda Bullejos",
        "repository": "aprender-markdown-jaime-garcia-bullejos-alu0100906806",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 13,
        "insertions": 68,
        "deletions": 66,
        "files": 11
    }
]
[
    {
        "username": "github-classroom[bot]",
        "repository": "aprender-markdown-jaime-garcia-bullejos-alu0100906806",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 0,
        "insertions": 0,
        "deletions": 0,
        "files": 0
    },
    {
        "username": "Jaime Garc\u00eda Bullejos",
        "repository": "aprender-markdown-jaime-garcia-bullejos-alu0100906806",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 13,
        "insertions": 68,
        "deletions": 66,
        "files": 11
    }
]
[
    {
        "username": "github-classroom[bot]",
        "repository": "aprender-markdown-manuel_curbelo_alu0100045130",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 0,
        "insertions": 0,
        "deletions": 0,
        "files": 0
    },
    {
        "username": "ManCurTru",
        "repository": "aprender-markdown-manuel_curbelo_alu0100045130",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 1,
        "commits": 29,
        "insertions": 95,
        "deletions": 49,
        "files": 29
    }
]
[
    {
        "username": "github-classroom[bot]",
        "repository": "aprender-markdown-manuel_curbelo_alu0100045130",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 0,
        "insertions": 0,
        "deletions": 0,
        "files": 0
    },
    {
        "username": "ManCurTru",
        "repository": "aprender-markdown-manuel_curbelo_alu0100045130",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 1,
        "commits": 29,
        "insertions": 95,
        "deletions": 49,
        "files": 29
    }
]
[
    {
        "username": "github-classroom[bot]",
        "repository": "aprender-markdown-nestor-gonzalez-lopez-alu0100108859",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 0,
        "insertions": 0,
        "deletions": 0,
        "files": 0
    },
    {
        "username": "N\u00e9stor Gonz\u00e1lez",
        "repository": "aprender-markdown-nestor-gonzalez-lopez-alu0100108859",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 3,
        "commits": 37,
        "insertions": 95,
        "deletions": 61,
        "files": 25
    }
]
[
    {
        "username": "github-classroom[bot]",
        "repository": "aprender-markdown-nestor-gonzalez-lopez-alu0100108859",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 0,
        "insertions": 0,
        "deletions": 0,
        "files": 0
    },
    {
        "username": "N\u00e9stor Gonz\u00e1lez",
        "repository": "aprender-markdown-nestor-gonzalez-lopez-alu0100108859",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 3,
        "commits": 37,
        "insertions": 95,
        "deletions": 61,
        "files": 25
    }
]
[
    {
        "username": "NoeliaRguezHdez",
        "repository": "aprender-markdown-noelia-rodriguez-hernandez-alu0100595420",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 29,
        "insertions": 109,
        "deletions": 60,
        "files": 24
    }
]
[
    {
        "username": "NoeliaRguezHdez",
        "repository": "aprender-markdown-noelia-rodriguez-hernandez-alu0100595420",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 29,
        "insertions": 109,
        "deletions": 60,
        "files": 24
    }
]
[
    {
        "username": "magodelnorte",
        "repository": "aprender-markdown-wim-van-hoye-alu0101520377",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 13,
        "insertions": 55,
        "deletions": 14,
        "files": 9
    },
    {
        "username": "Guillermo",
        "repository": "aprender-markdown-wim-van-hoye-alu0101520377",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 13,
        "insertions": 55,
        "deletions": 14,
        "files": 10
    },
    {
        "username": "github-classroom[bot]",
        "repository": "aprender-markdown-wim-van-hoye-alu0101520377",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 0,
        "insertions": 0,
        "deletions": 0,
        "files": 0
    }
]
[
    {
        "username": "magodelnorte",
        "repository": "aprender-markdown-wim-van-hoye-alu0101520377",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 13,
        "insertions": 55,
        "deletions": 14,
        "files": 9
    },
    {
        "username": "Guillermo",
        "repository": "aprender-markdown-wim-van-hoye-alu0101520377",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 13,
        "insertions": 55,
        "deletions": 14,
        "files": 10
    },
    {
        "username": "github-classroom[bot]",
        "repository": "aprender-markdown-wim-van-hoye-alu0101520377",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 0,
        "insertions": 0,
        "deletions": 0,
        "files": 0
    }
]
[
    {
        "username": "alu0100951844",
        "repository": "aprender-markdown-yeray_exposito_garcia_alu0100951844",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 19,
        "insertions": 59,
        "deletions": 20,
        "files": 15
    },
    {
        "username": "github-classroom[bot]",
        "repository": "aprender-markdown-yeray_exposito_garcia_alu0100951844",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 0,
        "insertions": 0,
        "deletions": 0,
        "files": 0
    }
]
[
    {
        "username": "alu0100951844",
        "repository": "aprender-markdown-yeray_exposito_garcia_alu0100951844",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 19,
        "insertions": 59,
        "deletions": 20,
        "files": 15
    },
    {
        "username": "github-classroom[bot]",
        "repository": "aprender-markdown-yeray_exposito_garcia_alu0100951844",
        "start_date": "01/07/2021",
        "end_date": "01/07/2022",
        "merges": 0,
        "commits": 0,
        "insertions": 0,
        "deletions": 0,
        "files": 0
    }
]
```

