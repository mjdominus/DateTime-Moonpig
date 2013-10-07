use strict;
use warnings;
use Test::More;
use Test::Fatal;
use Try::Tiny;

use DateTime::Moonpig;

sub jan {
  my ($day) = @_;
  DateTime::Moonpig->new( year => 2000, month => 1, day => $day );
}

my $dt = jan(1);

for my $no (qw(
        set_time_zone
        add_duration
        subtract_duration

        truncate

        set

        set_year
        set_month
        set_day
        set_hour
        set_minute
        set_second
        set_nanosecond
        set_time_zone
        set_locale
        set_formatter
             )) {
  like(exception { $dt->$no() },
       qr/^Do not mutate DateTime objects!/,
       "$no method should fail");
}

# like(exception { $dt + [] },

done_testing;
