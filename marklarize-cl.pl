#!/usr/bin/env perl

use lib "lib";
use Marklarizer qw(tagger marklarize_text);

my $tagger = Marklarizer::tagger;

print(Marklarizer::marklarize_text($_, $tagger), "\n") while (<>);
