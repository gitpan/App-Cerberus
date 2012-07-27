
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "A pluggable Perl web service to preprocess web requests. Plugins can add geo, timezone and browser metadata, and throttle request rate.",
  "AUTHOR" => "Clinton Gormley <drtech\@cpan.org>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "App-Cerberus",
  "EXE_FILES" => [
    "bin/cerberus.pl"
  ],
  "LICENSE" => "perl",
  "NAME" => "App::Cerberus",
  "PREREQ_PM" => {
    "Any::URI::Escape" => 0,
    "Cache::Memcached::Fast" => 0,
    "Carp" => 0,
    "DateTime" => 0,
    "DateTime::TimeZone::Tzfile" => 0,
    "File::Spec::Functions" => 0,
    "FindBin" => 0,
    "Geo::IP" => 0,
    "HTTP::BrowserDetect" => 0,
    "HTTP::Tiny" => 0,
    "JSON" => 0,
    "List::MoreUtils" => 0,
    "List::Util" => 0,
    "Net::IP::Match::Regexp" => 0,
    "Plack::Request" => 0,
    "Plack::Runner" => 0,
    "Pod::Usage" => 0,
    "Time::OlsonTZ::Data" => 0,
    "YAML" => 0,
    "parent" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.06",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



