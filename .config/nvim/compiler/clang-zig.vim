if exists("current_compiler")
	finish
endif

let current_compiler = "clang-zig"

CompilerSet makeprg=zig\ build
CompilerSet errorformat=
			\%f:%l:%c:\ %trror:\ %m,%-G%.%#
