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

# vim: expandtab shiftwidth=4
