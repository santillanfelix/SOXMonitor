#!/usr/bin/env perl 
# vim: set ts=2 sw=2 sts=2 et si ai: 

# fstat.pl - when you need get information of a file
# =
# 
# Andres Aquino <aquino(at)hp.com>
# Hewlett-Packard Company | EBS
# 
use File::stat;
use Time::Local;
use Digest::MD5 qw(md5_base64);


$filename=$ARGV[0];
$sb = stat($filename) or die "Ups, no $filename";
printf "[%s]\n", $filename;
printf "  Size: %s\n", $sb->size;
printf "  User: %s\n", $sb->uid;
printf " Group: %s\n", $sb->gid;
printf " Perms: %04o\n", $sb->mode & 07777;
($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($sb->atime);
printf " aTime: %s%02o%02o\n",($year+1900,$mon,$mday);
($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($sb->mtime);
printf " mTime: %s%02o%02o\n",($year+1900,$mon,$mday);

open(FILE, $filename) or die "Can't open '$file': $!";
binmode(FILE);
printf "   md5: %s\n", Digest::MD5->new->addfile(*FILE)->hexdigest;


