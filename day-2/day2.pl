#! /usr/bin/env perl

use strict;
use warnings;
use feature 'say';

use List::Util qw(min max product);

open my $fh, "<", "input"
    or die "Could not open input file: $!\n";

my ($paper, $ribbon);;
while (my $package_size = <$fh>) {
    chomp $package_size;
    my @dimensions  = split "x", $package_size;

    my @sides = (
        $dimensions[0] * $dimensions[1],
        $dimensions[1] * $dimensions[2],
        $dimensions[2] * $dimensions[0]
    );

    my $surface_area = 2 * $sides[0] + 2 * $sides[1] + 2 * $sides[2];

    my $extra = min @sides;

    $paper += $surface_area + $extra;

    my $bow = product @dimensions;

    my $big_side = max @dimensions;
    while (my $dim = shift @dimensions) {
        $ribbon += $dim*2;
    }
    $ribbon -= $big_side*2;
    $ribbon += $bow;
}

close $fh;

say "The elves need $paper square feet of wrapping paper.";
say "The elves need $ribbon feet of ribbon.";
