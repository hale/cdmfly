cdmfly
======

condownmarkference.ly.  Deliberately obtuse name so that I have to change it later.

## Learning outcomes

1) Use Turnip to BDD a command line application
2) Creating gems from scratch.
3) Use some of the technologies and ideas voiced at [allyourbaseconf](http://allyourbaseconf.com/) 2012.

## Inception

At conferences, some people make notes and lots of people tweet.  Somebody made 
notes and had a quick one-liner ruby script to regularly commit and push the notes to 
a public github repo.  

It would be nice if there was a page you could go to when sitting in conference talks and watch a
live-updating stream of someone's notes.  Perhaps you could comment on what they're saying, 
perhaps we display hastag scoped tweets alongside the notes. 

## What is this?

This is the client gem you run when making notes.  It detects file changes
and push new commits to github. It also creates an account on the server-side responsible
for publishing the notes.

The server will use a github service hook to listen for new pushes and fetch the code. It will use
ActionController::Live (Rails 4 Live Streaming) i.e. Server Sent Events (SSE) to communicate with the 
browser. Github is the persistent 'database' tier; the server will cache in Redis.

## Project status

Initial tests written for the local ruby client.  Project suspended until further notice due to other commitments. 
