function __fish_odin_needs_command
    set cmd (commandline -opc)
    if [ (count $cmd) -eq 1 -a $cmd[1] = odin ]
        return 0
    end
    return 1
end

function __fish_odin_using_command
    set cmd (commandline -opc)
    if [ (count $cmd) -gt 1 ]
        if [ $argv[1] = $cmd[2] ]
            return 0
        end
    end
    return 1
end

complete -f -c odin -n __fish_odin_needs_command -a build -d "compile directory of .odin files, as an executable."
complete -f -c odin -n __fish_odin_needs_command -a run -d "same as 'build', but also then runs the newly compiled executable."
complete -f -c odin -n __fish_odin_needs_command -a check -d "parse, and type check a directory of .odin files"
complete -f -c odin -n __fish_odin_needs_command -a query -r -d "parse, type check, and output a .json file containing information about the program"
complete -f -c odin -n __fish_odin_needs_command -a strip-semicolon -d "parse, type check, and remove unneeded semicolons from the entire program"
complete -f -c odin -n __fish_odin_needs_command -a test -d "build ands runs procedures with the attribute @(test) in the initial package"
complete -f -c odin -n __fish_odin_needs_command -a doc -d "generate documentation on a directory of .odin files"
complete -f -c odin -n __fish_odin_needs_command -a version -d "print version"
complete -f -c odin -n __fish_odin_needs_command -a report -d "print information useful to reporting a bug"

set -l commands build run check strip-semicolon test

complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o help -d "Prints help for the build command"
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o file -d "Tells `odin build` to treat the given file as a self-contained package.. This means that `<dir>/a.odin` won't have access to `<dir>/b.odin`'s contents."
complete -F -c odin -n "__fish_seen_subcommand_from $commands" -o out -d "Set the file name of the outputted executable."
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o opt -r -a "0 1 2 3" -d "Set the optimization level for compilation"
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -s o -r -a "minimal size speed" -d "Set the optimization mode for compilation"
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o show-timings -d "Shows basic overview of the timings of different stages within the compiler in milliseconds"
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o show-more-timings -d "Shows an advanced overview of the timings of different stages within the compiler in milliseconds"
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o export-timings -r -a "json csv" -d "Export timings to one of a few formats. Requires `-show-timings` or `-show-more-timings`"
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o thread-count -r -d "Override the number of threads the compiler will use to compile with"
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o keep-temp-files -d "Keeps the temporary files generated during compilation"
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o collection -r -d "Defines a library collection used for imports. Example: -collection:shared=dir/to/shared. To use: import \"shared:foo\""
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o define -r -d "Defines a global constant with a value. Example: -define:SPAM=123. To use:  #config(SPAM, default_value)"
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o build-mode -r -a "exe dll shared obj object assembly assembler asm llvm-ir llvm" -d "Sets the build mode"
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o target -r -d "Sets the target for the executable to be built in"
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o debug -d "Enabled debug information, and defines the global constant ODIN_DEBUG to be 'true'"
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o disable-assert -d "Disable the code generation of the built-in run-time 'assert' procedure, and defines the global constant ODIN_DISABLE_ASSERT to be 'true'"
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o no-bounds-check -d "Disables bounds checking program wide"
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o no-crt -d "Disables automatic linking with the C Run Time"
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o lld -d "Use the LLD linker rather than the default"
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o use-separate-modules -d "The backend generates multiple build units which are then linked together. Normally, a single build unit is generated for a standard project"
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o threaded-checker -d "Multithread the semantic checker stage"
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o vet -d "Do extra checks on the code. Extra checks include:. \tVariable shadowing within procedures. \tUnused declarations"
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o vet-extra -d "Do even more checks than standard vet on the code. To treat the extra warnings as errors, use -warnings-as-errors"
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o ignore-unknown-attributes -d "Ignores unknown attributes. This can be used with metaprogramming tools"
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o no-entry-point -d "Removes default requirement of an entry point (e.g. main procedure)"
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o extra-linker-flags -r -d " Adds extra linker specific flags in a string"
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o extra-assembler-flags -r -d " Adds extra assembler specific flags in a string"
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o microarch -r -d "Specifies the specific micro-architecture for the build in a string"
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o reloc-mode -r -a "default static loc dynamic-no-pic" -d "Specifies the reloc mode"
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o disable-red-zone -d "Disable red zone on a supported freestanding target"
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o disallow-do -d "Disallows the 'do' keyword in the project"
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o default-to-nil-allocator -d "Sets the default allocator to be the nil_allocator, an allocator which does nothing"
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o strict-style -d " Errors on unneeded tokens, such as unneeded semicolons"
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o strict-style-init-only -d "Errors on unneeded tokens, such as unneeded semicolons, only on the initial project"
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o ignore-warnings -d "Ignores warning messages"
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o warnings-as-errors -d "Treats warning messages as error messages"
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o verbose-errors -d "Prints verbose error messages showing the code on that line and the location in that line"
complete -f -c odin -n "__fish_seen_subcommand_from $commands" -o foreign-error-procedures -d "States that the error procedues used in the runtime are defined in a s__fish_seen_subcommands_from $commands"

complete -F -c odin -n '__fish_odin_using_command query' -o global-definitions -d "outputs a JSON file of global definitions"
complete -F -c odin -n '__fish_odin_using_command query' -o go-to-definitions -d "outputs a OGTD binary file of go to definitions for identifiers within an Odin project"

complete -F -c odin -n '__fish_odin_using_command doc' -o short -d "Show shortened documentation for the packages"
complete -F -c odin -n '__fish_odin_using_command doc' -o all-packages -d "Generates documentation for all packages used in the current project"
complete -F -c odin -n '__fish_odin_using_command doc' -o doc-format -d "Generates documentation as the .odin-doc format (useful for external tooling)"

