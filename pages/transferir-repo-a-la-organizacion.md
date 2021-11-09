Primero:

1. Abre  el navegador en el repo que quieres transferir.
2. Pulsa el botón de gitpod y abre el contenedor GitPod.


Usaré el de Alejandro como ejemplo. Estándo en el workspace GitPod del repo `alu0100879902/static-generator-alejandro-gonzalez-gonzalez-alu0100879902` hacemos lo siguiente:

Veamos adonde apunta el remoto:

```
gitpod /workspace/static-generator-alejandro-gonzalez-gonzalez-alu0100879902 $ git remote -v
origin  https://github.com/alu0100879902/static-generator-alejandro-gonzalez-gonzalez-alu0100879902.git (fetch)
origin  https://github.com/alu0100879902/static-generator-alejandro-gonzalez-gonzalez-alu0100879902.git (push)
upstream        https://github.com/crguezl/minimal-mistakes.git (fetch)
upstream        https://github.com/crguezl/minimal-mistakes.git (push)
```

Lo renombramos:

```
gitpod /workspace/static-generator-alejandro-gonzalez-gonzalez-alu0100879902 $ git remote rename origin alejandro
gitpod /workspace/static-generator-alejandro-gonzalez-gonzalez-alu0100879902 $ git remote -v
alejandro       https://github.com/alu0100879902/static-generator-alejandro-gonzalez-gonzalez-alu0100879902.git (fetch)
alejandro       https://github.com/alu0100879902/static-generator-alejandro-gonzalez-gonzalez-alu0100879902.git (push)
upstream        https://github.com/crguezl/minimal-mistakes.git (fetch)
upstream        https://github.com/crguezl/minimal-mistakes.git (push)
```

Ahora vamos a crear un repo con el mismo nombre en la organización. 
Podemos hacerlo con la interfaz web o bien usar el programa [gh](https://cli.github.com/) que 
nos permite manipular los repos de GitHub. 

Para ello primero nos autenticamos con gh:

```
gitpod /workspace/static-generator-alejandro-gonzalez-gonzalez-alu0100879902 $ gh auth login
? What account do you want to log into? GitHub.com
? What is your preferred protocol for Git operations? HTTPS
? Authenticate Git with your GitHub credentials? Yes
? How would you like to authenticate GitHub CLI? Paste an authentication token
Tip: you can generate a Personal Access Token here https://github.com/settings/tokens
```

En este momento me voy a <https://github.com/settings/tokens> y genero un token, dándole los permisos suficientes:

![]({{site.baseurl}}/assets/images/gh-token-generation.png)

y lo copio:

```
The minimum required scopes are 'repo', 'read:org', 'workflow'.
? Paste your authentication token: ****************************************
- gh config set -h github.com git_protocol https
✓ Configured git protocol
✓ Logged in as crguezl


A new release of gh is available: 2.0.0 → v2.2.0
https://github.com/cli/cli/releases/tag/v2.2.0
```

Ahora creo el repo en GH dentro de la organización:

```
gitpod /workspace/static-generator-alejandro-gonzalez-gonzalez-alu0100879902 $ gh repo create ULL-MFP-AET-2122/static-generator-alejandro-gonzalez-gonzalez-alu0100879902
? Visibility Public
? Would you like to add a .gitignore? No
? Would you like to add a license? No
? This will add an "origin" git remote to your local repository. Continue? Yes
✓ Created repository ULL-MFP-AET-2122/static-generator-alejandro-gonzalez-gonzalez-alu0100879902 on GitHub
✓ Added remote https://github.com/ULL-MFP-AET-2122/static-generator-alejandro-gonzalez-gonzalez-alu0100879902.git
```
Ya está el repo creado:

![]({{site.baseurl}}/assets/images/gh-repo-created.png)

Y lo añado como remoto por defecto al workspace:

```
git remote add origin  https://github.com/ULL-MFP-AET-2122/static-generator-alejandro-gonzalez-gonzalez-alu0100879902.git
```

Ahora tenemos 2 remotos además del original:
---
---

```
gitpod /workspace/static-generator-alejandro-gonzalez-gonzalez-alu0100879902 $ git remote -v
alejandro       https://github.com/alu0100879902/static-generator-alejandro-gonzalez-gonzalez-alu0100879902.git (fetch)
alejandro       https://github.com/alu0100879902/static-generator-alejandro-gonzalez-gonzalez-alu0100879902.git (push)
origin  https://github.com/ULL-MFP-AET-2122/static-generator-alejandro-gonzalez-gonzalez-alu0100879902.git (fetch)
origin  https://github.com/ULL-MFP-AET-2122/static-generator-alejandro-gonzalez-gonzalez-alu0100879902.git (push)
upstream        https://github.com/crguezl/minimal-mistakes.git (fetch)
upstream        https://github.com/crguezl/minimal-mistakes.git (push)
```

A continuación  empujamos al nuevo remoto `origin`:

```
gitpod /workspace/static-generator-alejandro-gonzalez-gonzalez-alu0100879902 $ git push -u origin master 
Enumerating objects: 16748, done.
Counting objects: 100% (16748/16748), done.
Delta compression using up to 16 threads
Compressing objects: 100% (6452/6452), done.
Writing objects: 100% (16748/16748), 43.97 MiB | 26.48 MiB/s, done.
Total 16748 (delta 10022), reused 16748 (delta 10022), pack-reused 0
remote: Resolving deltas: 100% (10022/10022), done.
To https://github.com/ULL-MFP-AET-2122/static-generator-alejandro-gonzalez-gonzalez-alu0100879902.git
 * [new branch]        master -> master
Branch 'master' set up to track remote branch 'master' from 'origin'.
``` 

Con esto ya tenemos la transferencia hecha.