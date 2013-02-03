#!/usr/bin/perl

use strict;
use warnings;
use DBI;

my $dbh = DBI -> connect ("DBI:SQLite:susitest.dbl","","",{RaiseError => 1, sqlite_unicode => 1}) or die $DBI::errstr ;

$dbh->do(q{CREATE TABLE accounts (username TEXT, password TEXT)});
$dbh->do(q{INSERT INTO accounts VALUES ('georgi' , 'abv')});
$dbh->do(q{INSERT INTO accounts VALUES ('kosta' , 'kdd')});
$dbh->do(q{INSERT INTO accounts VALUES ('georgiu' , 'abv')});
$dbh->do(q{INSERT INTO accounts VALUES ('kostad' , 'ьяа')});

my $sbh = $dbh->prepare(q{SELECT a.username FROM accounts a WHERE a.password == 'abv'});
$sbh->execute();

while ( my @row = $sbh->fetchrow_array ) {
    print "@row\n";
  }

$dbh -> disconnect();