---
---

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
