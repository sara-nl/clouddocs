---
layout: default
---

## Contributing through GitHub

You are welcome to add your additions and improvements to the documentation directly to the repository. For this, you'll need a GitHub account and a little knowledge on git:

 1. [Fork](https://help.github.com/articles/fork-a-repo/) our repository
 2. Git pull your fork
 3. Make your changes, commit and push them back to GitHub
 4. Create a [pull request](https://help.github.com/articles/proposing-changes-to-a-project-with-pull-requests/) to inform us of your changes
 5. After we've reviewed and accepted your work, we will merge your commits and the documentation will be updated automatically.

All documentation is written in markdown. Behind the scenes we use GitHub Pages to automatically publish the documentation. GitHub Pages in turn uses Jekyll to render the pages. Below are some useful links to documentations on all these techniques and systems:

 * [Markdown basics](https://help.github.com/articles/markdown-basics/)
 * [GitHub's git cheat sheet](https://help.github.com/articles/git-cheatsheet/)
 * [GitHub Pages](https://pages.github.com/)
 * [Jekyll and GitHub Pages](https://help.github.com/articles/using-jekyll-with-pages/)
 * [Jekyll documentation](https://jekyllrb.com/docs/home/)

However, don't worry to much about all this new information. You'll see that markdown is quit intuitive. Besides, we will check your changes too. If you find it all too overwhelming anyway, or if you just don't feel like going through all this hussle, you are always free to just send us an e-mail with your remarks and we will change the documentation ourselves: [helpdesk@surfsara.nl](mailto:helpdesk@surfsara.nl?subject=HPC%20Cloud%20documentation%20comments)

## MarkDown best practice for SURFsara HPC Cloud documentation

Please consult the following guidelines before contributing updates, bug fixes,
or other corrections.

> **NOTE:**
>
> _This section is still under construction. As we need your feedback to keep
improving the documentation, we encourange you to send your remarks at
helpdesk@surfsara.nl._

### Text emphasis conventions

* Highlight text  
Highlight important text in **bold letters**. Have a look at the source and
notice the double asterisks wrapping the emphasised text.

* OpenNebula keywords  
We want to distinguish `OpenNebula` keywords, such as `Virtual Machine` or
`Template`. Have a look at the source and notice the accents wrapping the keywords.

* Menu items  
We want to emphasise user interface menu items, such as _Sign Out_. Have a look
at the source and notice the underscore wrapping the keyword.

* Important notice  
Callouts and text blocks of high attention should be different to body text.  
Here is an example.

> **NOTE**
>
>VMs are created by instantiating a `template`.

Have a look at the source and notice the character `>`.

### Command lines and output

We want command lines without leading prompt, so that the user may tripple-click and copy/paste it.

To stimulate non-root access, prefix with `sudo` if needed.

Output should be visually different from the command by block-quoting it.

Here is an example.

---

Please execute the following command:

```bash
sudo rm -rf * .o
```

Expected output:

>
```
rm: .o: No such file or directory
```

---

Have a look at the source and notice the blank line between `Expected output:` and the `>`.
This seems to be the only way to have different editors and renderers to create the same output.

### Creating a new page
You can create a new page, by creating a new markdown file. The file should have .markdown as extension, because else the 'Edit on GitHub' button will not function.

Start the file with the name of the template you want to use. Available templates can be seen in the _layouts directory. You can use the filename, without the extension. For example:

```
---
layout: default
---
```

After these three lines, you can add regular markdown. You can link to the new file by using the filename without the extension.

### Testing the documentation with Jekyll and Docker

Before committing anything, you can first have a look at your changes using Jekyll. You can install Jekyll normally (see link to Jekyll website at the top of this page), or use docker for this. From the root of this repository, run:

```bash
sudo docker run --detach --name=jekyll --label=jekyll --volume=$(pwd):/srv/jekyll -t jekyll/jekyll:pages jekyll s
sudo docker inspect jekyll | grep '"IPAddress"' | sed -re 's|[[:space:]]*"IPAddress": "([^"]+)",|View your documentation at http://\1|'
```

This will start the Docker container in the background and show you the address where you can view your documentation. This is basically through HTTP access on port 4000 of the IP address of your container.

Please, also have a look at the [Docker documentation](https://docs.docker.com/) for more information on Docker.

### Other

Please add more best practices here.
