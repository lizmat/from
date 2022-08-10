sub EXPORT($distro, *@exports is copy) {
    if @exports {
        if @exports.head eq "!" {
            @exports.shift;
            @exports.prepend: <EXPORT ::?PACKAGE $_ $?PACKAGE>;

            Map.new: ("use $distro; MY::\{MY::.keys.map(\{
                \$_ unless \$_ (elem) @exports
            })}:p".EVAL)
        }
        else {
            Map.new: ("use $distro; MY::<@exports[]>:p".EVAL)
        }
    }
    else {
        "use $distro".EVAL;
        BEGIN Map.new
    }
}

=begin pod

=head1 NAME

from - load a module and import selected items from it

=head1 SYNOPSIS

=begin code :lang<raku>

use from <Test &plan &ok>;  # only import "plan" and "ok"

plan 1;
ok "foo", "bar";  # ok 1 - bar

use from "Foo";  # use Foo, but don't import anything

use from <Test ! &skip>;  # import everything *except* skip

=end code

=head1 DESCRIPTION

from is a helper module that allows you to load any given module and
only import selected items from whatever that module imports.  This can
be helpful when there is a conflict between different modules exporting
something with the same name (such as C<skip> in the Raku core, and the
C<skip> subroutine provided by C<Test>.

The first argument indicates the name of the module to be loaded.  If
it is the only argument, then the module will be loaded without doing
B<any> of its imports (which is basically the same as C<need>).

If the second argument is a sole exclamation mark, it indicates that
the rest of the arguments are items that should B<not> be imported.

The rest of the arguments indicate the items that should (not) be
imported.

=head1 AUTHOR

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/from .
Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing to a
L<small sponsorship|https://github.com/sponsors/lizmat/>  would mean a great
deal to me!

=head1 COPYRIGHT AND LICENSE

Copyright 2022 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
