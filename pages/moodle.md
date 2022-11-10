---
title: Importing a Website into Moodle
---

# {{ page.title }}

It is possible to host a website within Moodle following these instructions:

1.  Ensure that all links within your webpages are relative to each other, meaning if you have an `index.html` page and a `book.html` page in the same directory, as a link to the `book.html` page from the `index page`, you have `/book.html`.  The links will not work properly otherwise. Read the section [Understanding site.url and site.baseurl](jekyll-baseurl.html) to learn how to do it with Jekyll
2.  Zip the root directory of the site into a single zip file. On a mac `zip -r _site.zip _site`
3.  Go to the Moodle course and click the <button>Turn Editing on</button> button
4.  Choose the Topics Block where you want to add the assignment and click **Add an activity or resource**.
5.  Select the **File** activity in the Activity Chooser.
6.  Add the zip file as the file for this resource.![Zip file added](https://forge.lafayette.edu/wp-content/uploads/sites/451/2018/07/Screen-Shot-2018-07-05-at-3.19.29-PM.png)
7.  Select the zip file in the file picker, and a popup window will appear.  
    - Select **unzip**, a folder will appear in the file picker.  
    
    ![Select "Unzip" to open the compressed website file](https://forge.lafayette.edu/wp-content/uploads/sites/451/2018/07/Screen-Shot-2020-05-28-at-1.14.18-PM.png)
8.  Navigate into the folder and select your “index” page.  
    - Once selected, choose the “Set main file” option from the popup window.  

      ![Set the main file](https://forge.lafayette.edu/wp-content/uploads/sites/451/2018/07/Screen-Shot-2018-07-05-at-3.22.28-PM.png)
9.  Under the “Appearance” resource option there are several Display options that allow you to set the webpage to be embedded in the site, open as a pop-up, etc.  
    ![Set the Display setting to "Embed"](https://forge.lafayette.edu/wp-content/uploads/sites/451/2018/07/Screen-Shot-2020-05-28-at-1.15.50-PM.png)

**Note:** Individual files can be updated after this process is done so you will not need to re-upload the entire zip file whenever a change is necessary.

## References

*   Here is the orginal article [Importing a Website into Moodle](https://help.lafayette.edu/importing-a-website-into-moodle/)
