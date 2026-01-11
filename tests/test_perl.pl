greet('Perl');

# Perl Advanced Syntax Test for Solarized Flat Theme
use strict;
use warnings;
use feature 'say', 'state', 'signatures';
no warnings 'experimental::signatures';

package Logger {
    sub log { my ($msg) = @_; say "[LOG] $msg"; }
}

package User {
    sub new { my ($class, %args) = @_; bless \%args, $class }
    sub name { $_[0]->{name} }
    sub active { $_[0]->{active} // 1 }
}

package Dog {
    our @ISA = ('Logger');
    sub new { my ($class, $name) = @_; bless { name => $name }, $class }
    sub greet {
        my ($self, $name) = @_;
        Logger::log("Greeting $name");
        say "Hello, $name!";
    }
    sub speak { my $self = shift; say "$self->{name} barks!"; }
}

package main;
my $user = User->new(name => 'Alice');
my $dog = Dog->new('Buddy');
$dog->greet($user->name);
$dog->speak;
my @nums = (1, 2, 3);
say join ", ", map { $_ * $_ } @nums;
eval { my $x = 10/0 };
say "Caught error: $@" if $@;
my $color = 'green';
for ($color) {
    /red/   && say 'Red',   next;
    /green/ && say 'Green', next;
    /blue/  && say 'Blue',  next;
}
my $closure = sub { say "Closure: $_[0]" };
$closure->('Test');
