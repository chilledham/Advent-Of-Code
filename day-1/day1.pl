#! /usr/bin/perl

use strict;
use warnings;
use feature 'say';

open my $input_fh, "<", "input"
    or die "Could not open input file. Died: $!\n";

my $instructions = do { local $/ = <$input_fh> };
chomp $instructions;

my @steps = split '', $instructions;

my ($floor, $steps, $basement_reached);
for my $step (@steps) {
    $floor++ if $step eq '(';
    $floor-- if $step eq ')';

    $steps++ unless $basement_reached;
    $basement_reached++ if $floor < 0;
}

say "Santa will end up on $floor.";
say "Santa enters the basement on move $steps";
