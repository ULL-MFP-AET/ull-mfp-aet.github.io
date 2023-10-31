---
video: "https://youtu.be/_W9B7qc9lVc"
---
# GitHub CodeSpaces

## Introduction 

GitHub Codespaces allows users to use a Visual Studio Code backed editor, terminal, and debugger along with GitHub version control in the browser or on a desktop. 

Integrating Codespaces into your GitHub Classroom experience can provide a scalable solution for quickly getting CS students started using virtually any device including Chromebooks and iPads. 
If it’s got a browser, it’s now a development environment for your students.

Here is the documentation: [GitHub Codespaces](https://docs.github.com/en/codespaces):

{% include youtubePlayer.html id="_W9B7qc9lVc" %}


## Teachers: Using it in Classroom Assignments

See section [Teachers: Using Codespaces in Classroom Assignments]({{ site.baseurl }}/pages/codespaces-github-classroom-assignment)

## Using it as a User

Puedes ver tus codespaces activos en el menú de tu perfil:

![](/assets/images/codespaces/codespaces-yours.png)

Here is an example working:

![](/assets/images/codespaces/codespaces-working.png)

And here an example of your codespaces page:

![](/assets/images/codespaces/codespaces-screen.png)

## Personalizing your Codespace

See section [Personalizing your Codespace]({{ site.baseurl }}/pages/codespaces-personalizing)

## Prebuilding your Codespaces to speed up codespace creation

To speed up codespace creation, you can configure your project to **prebuild codespaces** for specific branches in specific regions. You create and configure prebuilds in your repository's settings. 

- Repository-level settings for GitHub Codespaces are available for all repositories owned by personal accounts.
- For repositories owned by organizations, repository-level settings for GitHub Codespaces are available for organizations on GitHub Team plans that there is the one you get from GH Education as a teacher. 

See the documentation at [codespaces/prebuilding-your-codespaces](https://docs.github.com/en/codespaces/prebuilding-your-codespaces).

A prebuild assembles the main components of a codespace for a particular combination of repository, branch, and devcontainer.json configuration file. 
It provides a quick way to create a new codespace. For complex and/or large repositories in particular, you can create a new codespace more quickly by using a prebuild.
Whenever you push changes to your repository, GitHub Codespaces uses GitHub Actions to automatically update your prebuilds.

