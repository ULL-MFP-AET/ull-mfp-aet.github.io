
# Descripción de la Práctica p05-t0-aprender-vscode

## Objetivos

En nuestro portátil de trabajo:

1. Instala [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git/)
   * Si sabes trabajar con la terminal/consola, configura [git siguiendo estas instrucciones](https://docs.github.com/es/free-pro-team@latest/github/getting-started-with-github/set-up-git) (nombre, correo, autenticación via ssh contra los servidores de GitHub, etc.)
   * Si no deseas utilizar la línea de comando, puedes descargar e instalar en su lugar el cliente <a href="https://desktop.github.com/">GitHub Desktop</a>,  una Graphical User Interface (GUI) para usar Git.  Para obtener más información, consulta la sección "<a href="/es/free-pro-team@latest/desktop/installing-and-configuring-github-desktop">Instalar y configurar GitHub Desktop</a>".
2. Instale [Visual Studio Code](https://code.visualstudio.com/) en tu máquina
3. Sigue los [tutoriales](#Tutoriales) de VSCode
4. Instala  el plugin [Remote SSH](https://code.visualstudio.com/docs/remote/ssh) y aprende a usarlo con el sistema de archivo de una máquina remota via SSH.
Para probar, tienes una máquina virtual a la que puede acceder via web y ssh en [iaas.ull.es](https://iaas.ull.es). Lea los documentos en la sección 
5. Instale y use la extensión [Live Share](https://visualstudio.microsoft.com/es/services/live-share/) para colaborar con un compañero
6. Elabore un informe con la experiencia adquirida

## Tutoriales de VSCode

### Guía de Usuario
*   [Basic Editing](https://code.visualstudio.com/docs/editor/codebasics)
*   [Extension Marketplace](https://code.visualstudio.com/docs/editor/extension-gallery)
*   [IntelliSense](https://code.visualstudio.com/docs/editor/intellisense)
*   [Code Navigation](https://code.visualstudio.com/docs/editor/editingevolved)
*   [Refactoring](https://code.visualstudio.com/docs/editor/refactoring)
*   [Debugging](https://code.visualstudio.com/docs/editor/debugging)
*   [Version Control](https://code.visualstudio.com/docs/editor/versioncontrol)
*   [Integrated Terminal](https://code.visualstudio.com/docs/editor/integrated-terminal)
*   [Multi-root Workspaces](https://code.visualstudio.com/docs/editor/multi-root-workspaces)
*   [Tasks](https://code.visualstudio.com/docs/editor/tasks)
*   [Snippets](https://code.visualstudio.com/docs/editor/userdefinedsnippets)
*   [Emmet](https://code.visualstudio.com/docs/editor/emmet)
*   [Command Line](https://code.visualstudio.com/docs/editor/command-line)
*   [Accessibility](https://code.visualstudio.com/docs/editor/accessibility)
###  Collaboration con Visual Studio Share

- [Introducing Visual Studio Live Share](https://code.visualstudio.com/blogs/2017/11/15/live-share)
- <a href="https://youtu.be/fWXe1HQ1wVA" target="_blank">Vídeo Visual Studio Live Share Demo on VS Code</a>

### SSH 

Editando con VSCode en la máquina iaas.ull.es con [Remote SSH](https://code.visualstudio.com/docs/remote/ssh)

Vaya a paquetes:

* <img src="{{site.baseurl}}/assets/images/remote-ssh-vscode/13.06.52.png " width="60%"/>

Busque por SSH:

* <img src="{{site.baseurl}}/assets/images/remote-ssh-vscode/13.07.05.png " width="60%"/>

Una vez instalado active la command palette Ctrl-Shift-P y escriba SSH:

* <img src="{{site.baseurl}}/assets/images/remote-ssh-vscode/13.10.42.png " width="60%"/>

Elige REMOTE-SSH: connect to host ...

* <img src="{{site.baseurl}}/assets/images/remote-ssh-vscode/13.11.16.png " width="60%"/>

Ahora escribimos la dirección IP o el nombre del host. 

 
Si queremos simplificar el proceso, podemos usar una pareja clave privada-pública y en un sitema unix (linux, mac os) ponemos una entrada en el fichero `~/.ssh/config` como esta:

````
Host sytws sytws2021   # Alias para la máquina
HostName 10.6.129.111  # IP 
User usuario           
IdentityFile /Users/casianorodriguezleon/.ssh/claveprivada
ServerAliveInterval 240
```

* <img src="{{site.baseurl}}/assets/images/remote-ssh-vscode/13.17.04.png" width="60%"/>



### Web Bookmarks

- <a href="https://marketplace.visualstudio.com/items?itemName=alu0100997910.webbookmarks" target="_blank">MarketPlace: Web Bookmarks a VSCode Extension by Alejandro Gonzalez Alonso</a> 
- <a href="https://marketplace.visualstudio.com/items?itemName=alu0100997910.webbookmarks" target="_blank">GitHub Repo: Web Bookmarks a VSCode Extension by Alejandro Gonzalez Alonso</a> 


## Infrastructure As A Service: El servicio iaas.ull.es de la ULL

* [Instrucciones para el uso de iaas.ull.es](https://casianorodriguezleon.gitbooks.io/ull-esit-1617/recursos/iaas.html)
  - [Gestor online de pools](https://iaas.ull.es/ovirtadmin/login) 
  - [IaaS - Uso de la aplicación de gestión de pools](https://docs.google.com/document/d/13vP4bd5LhnfNJvV6ncz20ZNTXfeg8ehWbw_ECkn4MAY/edit#)
  - [Video del profesor: iaas.ull.es](https://youtu.be/qKHgbV0lYbA)
  - [https://iaas.ull.es/mismaquinas](https://iaas.ull.es/mismaquinas) 

* [Servicio IaaS EULA y Solicitud de servicio
](https://docs.google.com/document/d/1noIAcAEzX1PuxxSLWuiTKzkLurAm9fL6vUmZN-A-kpE/edit?usp=sharing)
  - Certificados SSL para máquinas IaaS de PAS/PDI: Los detalles, la forma de solicitarlos y demás características en el documento del "EULA y Solicitud de Servicio", sección "Certificados SSL para máquinas IaaS de PAS/PDI"
