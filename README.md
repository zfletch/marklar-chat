# Marklar Chat

This is a chat server built with the [Mojolicious](http://mojolicio.us/) Perl micro-framework.
It uses the [Lingua::EN::Tagger](http://search.cpan.org/dist/Lingua-EN-Tagger/Tagger.pm)
module to identify all nouns (people, places, or things) and turn them into the word "marklar."

## Required Perl modules

* [Mojolicious](http://search.cpan.org/~sri/Mojolicious-7.29/lib/Mojolicious.pm)
* [Lingua::EN::Tagger](http://search.cpan.org/dist/Lingua-EN-Tagger/Tagger.pm)
* [List::MoreUtils](http://search.cpan.org/~rehsack/List-MoreUtils-0.413/lib/List/MoreUtils.pm)

## How to run

* `morbo script/marklar_chat` then visit `http://localhost:3000/`
* Or use the command line client: `perl marklarize-cl.pl file1 file2 ...`

## How to run tests

* `script/marklar_chat test`
