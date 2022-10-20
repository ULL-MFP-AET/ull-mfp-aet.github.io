---
title: Edición en la Nube 
toc: true
--- 

# {{ page.title }}

Hay múltiples formas de editar en la nube un repositorio GitHub.
Recogemos aquí estos:

1. Editar directamente usando el editor on-line de GitHub
2. Usar el editor GitHub.dev: simplemente  tecleando el punto cuando se está visitando el repo
3. Usar GitPod
4. Usar Codespaces (si se dispone de este servicio)

## Editor on-line de GitHub

Véase 

* La sección [Editar archivos](https://docs.github.com/es/repositories/working-with-files/managing-files/editing-files)
* El Editor on-line usado por GH es [Codemirror](https://codemirror.net/)
* [Documentación GitHub sobre la Interfaz Web]({{site.baseurl}}/pages/documentacion-github-interfaz-web)

## Editing with GitHub.dev Editor

### Period in a repo

From any repo or pull request, developers can simply press the period (`.`) key to bring up the browser-based VS Code environment with the source code file ready for editing. 

### Substitute github by github.dev in a GitHub URL

That dot press to bring up the web-based editor takes you to <https://github.dev/>, so the same one-press `.` functionality can be duplicated just by changing a URL from "github.com" to "github.dev".

See also:

* [One-Click VS Code in Browser from GitHub Repo ](https://visualstudiomagazine.com/articles/2021/08/31/github-vs-code.aspx)

## CodeSpaces

Codespaces es un servicio de GH que provee el mismo entorno de desarrollo que VSCode en la nube de GH. 

* Este conjunto de videos es conveniente para empezar con Codespaces <https://m.youtube.com/playlist?list=PLmsFUfdnGr3wTl-NCblzcrEv2lFSX975->
* [GitHub Codespaces](https://docs.github.com/en/codespaces) en docs.github.com
* [GitHub Codespaces vs Gitpod – Full Stack Development Moves to the Cloud](https://www.freecodecamp.org/news/github-codespaces-vs-gitpod-cloud-based-dev-environments/) AUGUST 30, 2021


Consulte la discusión en <https://github.com/community/Global-Campus-Teachers/discussions/118#discussioncomment-3715087>

## GitPod 

Gitpod is an open source platform for automated and ready-to-code development environments that blends into your existing workflow. It enables developers to describe their dev environment as code and start instant and fresh development environments for each new task directly from your browser.

### Aprendiendo GitPod

* [Getting Started](https://www.gitpod.io/docs/getting-started)

### Configure Gitpod

* [Configuring GitPod](gitpod-configure)


### Botón GitPod

Para tener el botón GitPod instala la correspondiente extensión en Chrome o Firefox

* [GitPod Browser Extension](https://www.gitpod.io/docs/browser-extension/)
* [Chrome extension](https://chrome.google.com/webstore/detail/gitpod-always-ready-to-co/dodmmooeoklaejobgleioelladacbeki?hl=es) in the webstore
* [fireFox addon](https://addons.mozilla.org/es/firefox/addon/gitpod/)
* [GitPod Screencasts](https://www.youtube.com/playlist?list=PL3TSF5whlprXVp-7Br2oKwQgU4bji1S7H) 7 videos


### Open GitPod in your local VSCode

En el menú de arriba a la izquierda elige la opción "Open in VS Code":

![]({{site.baseurl}}/assets/images/gitpod/gitpod-open-in-vscode.png)

Tienes que instalar la extensión [GitPod]() the VSCode y darle los permisos.
A partir de ese momento puedes editar con tu VSCode local en el contenedor de GitPod.

See it running in my local machine, after the VSCode has been opened:

![]({{site.baseurl}}/assets/images/gitpod/gitpod-opened-in-vscode.png)

Observe the output in the terminal. We are running on the GitPod docker container


¡Ojo! tu VSCode local está compartiendo el GitPod Workspace. Cualquier modificación que hagas en el VSCode local se refleja en el GitPod Workspace en la nube y viceversa.


### GitPod Sharing

See [Sharing Running Workspaces](https://www.gitpod.io/docs/sharing-and-collaboration#sharing-running-workspaces)

Básicamente: en [gitpod.io/workspaces](https://gitpod.io/workspaces) en los tres puntitos elegimos la opción compartir.
Luego compartimos la URL del ws con la otra persona.

A fecha de hoy, no muestra los cursores de los participantes.



#### Snapshots

Gitpod **lets you create reproducible examples for any programming environment and any size of project**. These are Snapshots.

* [Creating reproducibles for any programming language](https://www.gitpod.io/blog/workspace-snapshots)

### Sustainable Node.js development with only a browser

See the article 

[Sustainable Node.js development with only a browser](https://www.gitpod.io/blog/node-js-development)


### GitPod: Oferta para Estudiantes

*  <https://education.github.com/>
* [GitHub Student Developer Pack](https://education.github.com/pack)
  * [Get the Student Developer Pack](https://education.github.com/pack/join)
* [GitPod is inside the GitHub Student Developer Pack](https://www.gitpod.io/github-student-developer-pack)

###  Oferta Plan Personal (2021) Profesores

En esta URL [https://gitpod.io/plans](https://gitpod.io/plans)
se puede solicitar un upgrade al plan "personal"  que permite acceder a repositorios privados si eres un miembro de una comunidad educativa. No he tenido que introducir tarjetas.

**Importante**: Cuando rellenes la solicitud ¡El campo VAT déjalo vacío!

Lo que pasa (Abril 2021) es que GitPod está siendo ofertado como parte del [GitHub teachers' toolbox](https://education.github.com/toolbox). Por tanto, si  tienes actualizado tu GitHub Toolbox, creo que tanto los profesores como los alumnos tienen acceso a repos privados y a la nube proveída por GitPod.





![]({{site.baseurl}}/assets/images/gitpod/8-horas-100-euros.png)


![teacher-coupon]({{site.baseurl}}/assets/images/gitpod/teacher-coupon.png)

**Está limitada a 100 horas de uso por mes**:

* [100 horas](https://www.gitpod.io/pricing)
* Repositorios privados


### Ejemplo: Jekyll Blog 

En el ejemplo se ve los apuntes de PL (un repo público usando Jekyll) siendo editado con VSCode:

![apuntes-pl-gitpod]({{site.baseurl}}/assets/images/gitpod/apuntes-pl-gitpod.png)

todo funciona bien.

Con este plan es posible acceder a repos privados. 

### Autorizando GitPod a Acceder a Nuestros repos

En el repo en GitHub aparece el nuevo botón verde con etiqueta "GitPod". Obsérvese que el repo es privado:

![boton-gitpod-en-repo-privado]({{site.baseurl}}/assets/images/gitpod/boton-gitpod-en-repo-privado.png)    

Cuando le damos  al botón "GitPod" por primera vez es posible que nos salga un mensaje de error:

![autorizar-gitpod-a-organizacion.png 8-horas-100-euros]({{site.baseurl}}/assets/images/gitpod/autorizar-gitpod-a-organizacion.png)

Le damos los permisos adecuados:

![gitpos-request-permissions]({{site.baseurl}}/assets/images/gitpod/gitpos-request-permissions.png)   

Pulsamos `Grant` sobre la organización a la que le queremos dar acceso:

![grant-access]({{site.baseurl}}/assets/images/gitpod/grant-access.png)                    

y ya podemos editar nuestros repos privados.

También podemos ir directamente en cualquier momento a la rl <https://github.com/settings/applications> y cambiar nuestros permisos.



### Drawbacks according to Pattacini

> Gitpod is fantastic but comes with some constraints that may affect yours and your students’ work:

> Obviously, you’d need to learn how to deal with Docker files and do some preliminary tests on your side. Getting accustomed to Docker might take some time :hourglass_flowing_sand:

> In a Gitpod workspace, the user has no sudo credentials. This is understandable and represents good practice, but sometimes it’d be convenient to install packages straight away from the console without the burden of adjusting the Dockerfile once more.

Pero en otro post posterior (Feb 25 2021) comenta:

> Just wanted to tell you that Gipod has been growing up tremendously as well as awesomely and, among the latest advancements it provides, we have now root access

> Gitpod is free only for public GitHub repositories. This is ok for public assignments but could be a hitch for private ones. An easy workaround could be to ask students to clone their private repositories only after the workspace is ready.

Esto se resuelve como he comentado

> There’s **the threshold of 100 hours/month per user**. Quite reasonable, but much depends on your classroom payload.
When you share a running workspace, you’ll share also your access to GitHub, which might not be desirable! This is a serious inconvenient during remote technical interviews, for example.

> Finally, don’t expect to have quantum computers available from free Cloud IDE’s services. After all, there’s a trade-off and resources are limited (e.g. no GPU), even though Gitpod seems quite generous in this sense.

### Docker Images

Si la [imagen](https://github.com/gitpod-io/workspace-images) por defecto no se adapta a lo que quieres
puedes [configurarla](https://www.gitpod.io/docs/config-docker)

Véase [Docker in Gitpod](https://www.gitpod.io/blog/docker-in-gitpod)

### Self Hosted

Gitpod, just as you know it from [gitpod.io](https://gitpod.io), can be deployed and operated on your own infrastructure. 
It supports different 

* cloud providers, 
* self-managed Kubernetes clusters, 
* corporate firewalls, and even 
* off-grid / air-gapped networks.

* [Gitpod Self-Hosted](https://www.gitpod.io/docs/self-hosted/latest/self-hosted)

You can find all configuration templates and installation scripts in the Gitpod repository:

<https://github.com/gitpod-io/gitpod>

If you already have a Kubernetes cluster, or don’t want/cannot use AWS or GCP, please follow the generic guide:

*   [Install Gitpod on Kubernetes](https://www.gitpod.io/docs/self-hosted/0.4.0/install/install-on-kubernetes/)

### Referencias sobre GitPod

{% include gitpod-references.md %}

