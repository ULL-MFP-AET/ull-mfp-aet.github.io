---
title: Importing a Website into Moodle
---

# {{ page.title }}

It is possible to host a website within Moodle following these instructions:

## Step 1  

Ensure that all links within your webpages are relative to each other, meaning if you have an `index.html` page and a `book.html` page in the same directory, as a link to the `book.html` page from the `index page`, you have `/book.html`.  

The links will not work properly otherwise. 

*  Read the section [Understanding site.url and site.baseurl](jekyll-baseurl.html) to learn how to do this with Jekyll

## Step 2: Zip the root directory of the site into a single zip file. 

### On Codespaces

On your codespaces and also in a mac you have installed the `zip` program: `zip -r _site.zip _site`

```
$ zip --help
Copyright (c) 1990-2008 Info-ZIP - Type 'zip "-L"' for software license.
Zip 3.0 (July 5th 2008). Usage:
zip [-options] [-b path] [-t mmddyyyy] [-n suffixes] [zipfile list] [-xi list]
The default action is to add or replace zipfile entries from list, which
can include the special name - to compress standard input.
If zipfile and list are omitted, zip compresses stdin to stdout.
-f   freshen: only changed files  -u   update: only changed or new files
-d   delete entries in zipfile    -m   move into zipfile (delete OS files)
-r   recurse into directories     -j   junk (don't record) directory names
-0   store only                   -l   convert LF to CR LF (-ll CR LF to LF)
-1   compress faster              -9   compress better
-q   quiet operation              -v   verbose operation/print version info
-c   add one-line comments        -z   add zipfile comment
-@   read names from stdin        -o   make zipfile as old as latest entry
-x   exclude the following names  -i   include only the following names
-F   fix zipfile (-FF try harder) -D   do not add directory entries
-A   adjust self-extracting exe   -J   junk zipfile prefix (unzipsfx)
-T   test zipfile integrity       -X   eXclude eXtra file attributes
-y   store symbolic links as the link instead of the referenced file
-e   encrypt                      -n   don't compress these suffixes
-h2  show more help
```

### Alternative: Use GitHub Action Generated Artifact

Got to the GH action for building the site and donwload the generated artifact zip file to your local machine

![]({{ site.baseurl }}/assets/images/website-gh-action-artifact.png)

## Step 3: Upload the zip file to Moodle

1.  Go to the Moodle course and click the <button>Turn Editing on</button> button
2.  Choose the Topics Block where you want to add the assignment and click **Add an activity or resource**.
3.  Select the **File** activity in the Activity Chooser.
4.  Add the zip file as the file for this resource.![Zip file added](https://forge.lafayette.edu/wp-content/uploads/sites/451/2018/07/Screen-Shot-2018-07-05-at-3.19.29-PM.png)
5.  Select the zip file in the file picker, and a popup window will appear.  
    - Select **unzip**, a folder will appear in the file picker.  
    
    ![Select "Unzip" to open the compressed website file](https://forge.lafayette.edu/wp-content/uploads/sites/451/2018/07/Screen-Shot-2020-05-28-at-1.14.18-PM.png)
6.  Navigate into the folder and select your “index” page.  
    - Once selected, choose the “Set main file” option from the popup window.  

      ![Set the main file](https://forge.lafayette.edu/wp-content/uploads/sites/451/2018/07/Screen-Shot-2018-07-05-at-3.22.28-PM.png)
7.  Under the “Appearance” resource option there are several Display options that allow you to set the webpage to be embedded in the site, open as a pop-up, etc.  
    ![Set the Display setting to "Embed"](https://forge.lafayette.edu/wp-content/uploads/sites/451/2018/07/Screen-Shot-2020-05-28-at-1.15.50-PM.png)

**Note:** Individual files can be updated after this process is done so you will not need to re-upload the entire zip file whenever a change is necessary.

## References

*   Here is the orginal article [Importing a Website into Moodle](https://help.lafayette.edu/importing-a-website-into-moodle/)
