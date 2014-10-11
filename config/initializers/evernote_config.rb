# Load libraries required by the Evernote OAuth
require 'oauth'
require 'oauth/consumer'
 
# Load Thrift & Evernote Ruby libraries
require "evernote_oauth"
 
# Client credentials
# Handled by Heroku on the server
# Locally taken care of by Foreman and .env file
# To get them, run:
# heroku plugins:install git://github.com/ddollar/heroku-config.git
# heroku config:pull --overwrite --interactive
 
# Connect to Sandbox server?
SANDBOX = true