package Marklarizer;

use warnings;
use strict;

use Lingua::EN::Tagger;
use List::MoreUtils qw(any);

my %marklars = (
  single => "marklar",
  plural => "marklars",
  # single => "hodor",
  # single => "smurf",
);

sub marklarize_word {
  my ($word, $tag) = @_;

  my @nouns = qw(nn nnp nnps nns);
  my @plural = qw(nnps nns);

  my @punctuation_right_space = qw(pp ppc ppr rrb pps pos);
  my @word_parts_right_space = qw('d 'm 's n't 've 'll 're);
  my @punctuation_left_space = qw(ppd ppl lrb);

  if ((any { $_ eq $tag } @punctuation_right_space) || (any { $_ eq $word } @word_parts_right_space)) {
    "!?$word";
  } elsif (any { $_ eq $tag } @punctuation_left_space) {
    "$word\$\)";
  } elsif (any { $_ eq $tag } @nouns) {
    my $marklar = (any { $_ eq $tag } @plural) ? $marklars{plural} : $marklars{single};

    if ($word =~ /^\p{Uppercase}+$/) {
      uc $marklar;
    } elsif ($word =~ /^\p{Uppercase}/) {
      ucfirst $marklar;
    } else {
      $marklar;
    }
  } else {
    $word;
  }
}

sub tagger {
  new Lingua::EN::Tagger;
}

sub marklarize_text {
  my ($text, $tagger) = @_;

  $tagger ||= tagger;

  return $text unless $tagger->_valid_text($text);

  my @words = $tagger->_clean_text($text);

  my $tag = $tagger->{'current_tag'};
  my (@tags) = map {
    $tag = $tagger->_assign_tag($tag, $tagger->_clean_word($_)) || 'nn';
    marklarize_word($_, $tag);
  } @words;

  $tagger->{'current_tag'} = $tag;
  $tagger->_reset;

  my $marklarized_text = join(' ', @tags);
  $marklarized_text =~ s/``\$\)/"\$\)/g;
  $marklarized_text =~ s/`\$\)/'\$\)/g;
  $marklarized_text =~ s/!\?''/!?"/g;
  $marklarized_text =~ s/ ?!\?//g;
  $marklarized_text =~ s/\$\) ?//g;

  $marklarized_text;
}

sub readable_non_marklar {
  my ($text, $tagger) = @_;

  $tagger ||= tagger;

  $tagger->get_readable($text);
}

1;

