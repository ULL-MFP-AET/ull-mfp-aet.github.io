---
video: "https://youtu.be/_W9B7qc9lVc"
---
# GitHub CodeSpaces

## Announcing GitHub Global Campus and Codespaces for Teachers

GitHub  announced in May 9th 2022 this message:

<https://github.com/github-community/Global-Campus-Teachers/discussions/79>

which is inside of the new page for everything that has to do with educational resources:

<https://education.github.com/>

One of the things they comment on is a certain number of hours of Codespaces integrated with Classroom:

* Your Global Campus teacher status with GitHub gives you a free monthly allowance of Codespaces hours to use in your classroom. 
* The free allowance is estimated to be enough for a class of 50 with 5 assignments per month, on a 2 core machine with 1 codespace stored per student, which is more than enough to get your students coding like pros in an environment that brings out the best in their skills and allows you to teach seamlessly. 
* For teachers whose workflows extend beyond the free allowance, more details on Codespaces billing can be found [here](https://docs.github.com/en/billing/managing-billing-for-github-codespaces/about-billing-for-codespaces#codespaces-pricing).


## Introduction 

GitHub Codespaces allows users to use a Visual Studio Code backed editor, terminal, and debugger along with GitHub version control in the browser or on a desktop. 

Integrating Codespaces into your GitHub Classroom experience can provide a scalable solution for quickly getting CS students started using virtually any device including Chromebooks and iPads. 
If it’s got a browser, it’s now a development environment for your students.

Here is the documentation: [GitHub Codespaces](https://docs.github.com/en/codespaces):

<youtube></youtube>

## Teachers: Using it in Classroom Assignments

Go to the classroom config and enable codespaces:

![](/images/codespaces/codespaces-github-classroom-settings.png)

Now inside an assignment you can choose codespaces as eeditor for the students:

![](/images/codespaces/codespaces-github-classroom-assignment.png)

## Using it as a User

![](/images/codespaces/codespaces-yours.png)

Here is an example working:

![](/images/codespaces/codespaces-working.png)

And here an example of your codespaces page:

![](/images/codespaces/codespaces-screen.png)

## Personalizing your Codespace

Si quieres personalizar tu Codespace, puedes leer [Personalizing GitHub Codespaces for your account](https://docs.github.com/en/codespaces/customizing-your-codespace/personalizing-github-codespaces-for-your-account).Puedes personalizar GitHub Codespaces usando un [repositorio `dotfiles` en GitHub](https://docs.github.com/en/codespaces/customizing-your-codespace/personalizing-github-codespaces-for-your-account#dotfiles) o usando [Settings Sync](https://docs.github.com/en/codespaces/customizing-your-codespace/personalizing-github-codespaces-for-your-account#settings-sync).

To speed up codespace creation, you can configure your project to **prebuild codespaces** for specific branches in specific regions. You create and configure prebuilds in your repository's settings. 

- Repository-level settings for GitHub Codespaces are available for all repositories owned by personal accounts.
- For repositories owned by organizations, repository-level settings for GitHub Codespaces are available for organizations on GitHub Team plans that there is the one you get from GH Education as a teacher. 

See the documentation at [codespaces/prebuilding-your-codespaces](https://docs.github.com/en/codespaces/prebuilding-your-codespaces).

A prebuild assembles the main components of a codespace for a particular combination of repository, branch, and devcontainer.json configuration file. 
It provides a quick way to create a new codespace. For complex and/or large repositories in particular, you can create a new codespace more quickly by using a prebuild.
Whenever you push changes to your repository, GitHub Codespaces uses GitHub Actions to automatically update your prebuilds.

See [crguezl/dotfiles](https://github.com/crguezl/dotfiles) (private repo)