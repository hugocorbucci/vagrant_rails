# Instructions

This repo contains nearly all that's necessary to have a rails dev workstation.

To get started:

    script/bootstrap
    vagrant up dev
    vagrant ssh dev
    cd workspace && script/server
    # visit http://localhost:9292/

or

    vagrant up deploy
    # visit http://localhost:8080/


# TODO

* Remove rails app, and generate it a new one
* setup headless UI testing (poltergeist)

