# Vercel

[Vercel][vercel]  is a platform for frontend frameworks and static sites, built to integrate with your headless content, commerce, or database.


[vercel]: https://vercel.com/docs

To set a hook to update yor site for each push go to settings of the project and fill the deploys hook form:


![]({{ site.baseurl }}/assets/images/vercel/vercel-create-hook.png)

Press the `create hook` button

![]({{ site.baseurl }}/assets/images/vercel/vercel-project-settings.png)

In this case the repo is a Jekll web site. The Vercel app is smart enough to detect it and builds the site using Jekyll:

![]({{ site.baseurl }}/assets/images/vercel/vercel-deployment-building.png)

and now we have our site deployed. In this example is at <https://crguezl-github-io.vercel.app/>:

[![]({{ site.baseurl }}/assets/images/vercel/deployment-completed.png)](https://crguezl-github-io.vercel.app/)](https://crguezl-github-io.vercel.app/)
