#  condownmarkference.ly / cdmf.ly 

## Server 

###  POST /webhook

*New commit has been posted, update datastore.*

* routes to a projects controller action with params[:id, :payload]
* The post receive hook payload gives an arrays of added, updated, deleted paths
	* https://help.github.com/articles/post-receive-hooks
* `GET /repos/:owner/:repo/contents/:path` returns file contents
	* http://developer.github.com/v3/repos/contents/#get-contents
	* for new or modified paths, store new data
	* for deleted paths, delete the key.

### POST /create

*Create a new project given JSON data*

#### Schema

owner{
	id,
	projects{
		project_id
	}
}

project{
	id,
	owner_id,
	documents,
		document_id
	}
}

document{
	id,
	owner_id,
	project_id,
	markdown
}
	

### GET /:id

*Shows the project page*

* live-reload update the client with SSE (server sent events)
	* `ActionController::Live`
	* http://tenderlovemaking.com/2012/07/30/is-it-live.html

### GET /

* instructions
* recent / trending projects
* search projects by name
* logged in github user's projects


## Client 

###  New project
 
* `cdmf new <project_name> [options]`
* check formatting of options
* check for and authenticate with git 
	* https://github.com/peter-murach/github#authorizations-api
* create new folder \<project_name\> and cd into it
* parse the command line options and put into JSON in `.cdmf`
	* if just `cdmf new` print some help
	* if just `cdmf new \<project_name\>`, start the interactive tutorial. 
* initialise a git repository within the folder, with a new readme
	* title in new
	* about cdmf.
* create a new project on the cdmf server
	* `POST cdmf.ly/create’
		* data is `.cdmf`
		* quit if no presence / bad formatting of `.cdmf`
	* receive a url like `http://www.cdmf.ly/ayb12`
	* put the given url in the .cdmf
* use github api to create a github repo with the same name as the folder
* use the github api to set up a post-receive hook 
	* http://developer.github.com/v3/repos/hooks/#create-a-hook
	* url is `cdmf.ly/webhook`
* make the first commit + push to github
* print success status and "to start monitoring, run `cdmf start`"

### Monitor an existing project

* `cd ayb12`
* `cdmf start`
* (take a look at cross platform file monitoring gems)
* every 5 seconds, look for changes
	* `git status —porcelain`
* if there are changes:
	* add everything `git add .`
	* make a new commit
	* in a seperate thread, push these changes to github

### Other commands

* cdmf launch - launches the website in the browser
* cdmf tweet - creates a tweet with a template "i'm creating notes on \<project name\>, view them here\<link\> \<hashtag\>"

### Settings

* put the settings file in `~/.cdmf_config’
* command line shortcuts: `cdmf set` which writes to `~/.cdmf_config’

things you can set:

| option | description |
|:-----------:|:------------|
| --twitter \<username\> | your twitter username |
| --hashtag | a hashtag which is associated with the notes |
| --website | a website associated with the notes |  
| --frequency | how frequently in seconds the client checks the filesystem for changes |


* Runs like a server - monitoring current directory
* When it detects a change, makes a git commit & does git push
	* message of commit might be the most recent header text in markdown.
	* `git add . && git commit -m ‘message’ && git push`
* Intialise a new project
	* cdfm new ayb12
	* answer questions