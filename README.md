[![Actions Status](https://github.com/lizmat/from/actions/workflows/test.yml/badge.svg)](https://github.com/lizmat/from/actions)

NAME
====

from - load a module and import selected items from it

SYNOPSIS
========

```raku
use from <Test &plan &ok>;  # only import "plan" and "ok"

plan 1;
ok "foo", "bar";  # ok 1 - bar

use from "Foo";  # use Foo, but don't import anything

use from <Test ! &skip>;  # import everything *except* skip
```

DESCRIPTION
===========

from is a helper module that allows you to load any given module and only import selected items from whatever that module imports. This can be helpful when there is a conflict between different modules exporting something with the same name (such as `skip` in the Raku core, and the `skip` subroutine provided by `Test`.

The first argument indicates the name of the module to be loaded. If it is the only argument, then the module will be loaded without doing **any** of its imports (which is basically the same as `need`).

If the second argument is a sole exclamation mark, it indicates that the rest of the arguments are items that should **not** be imported.

The rest of the arguments indicate the items that should (not) be imported.

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/from . Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing to a [small sponsorship](https://github.com/sponsors/lizmat/) would mean a great deal to me!

COPYRIGHT AND LICENSE
=====================

Copyright 2022 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

