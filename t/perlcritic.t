#! /usr/bin/perl
#---------------------------------------------------------------------

use Test::More;

plan skip_all => "Don't want automated Perl::Critic reports"
    if $ENV{AUTOMATED_TESTING};

# ProhibitAccessOfPrivateData is a badly implemented policy that bans
# all use of hashrefs
eval <<'';
use Test::Perl::Critic (qw(-verbose 10
                           -exclude) => ['ProhibitAccessOfPrivateData']);

plan skip_all => "Test::Perl::Critic required for testing PBP compliance" if $@;

all_critic_ok();
