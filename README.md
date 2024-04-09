# go.jetify.com

Static site for `go.jetify.com` module paths.

To add a new module, call the `module` function in `gen.sh` with the new
module's repository name, repository root path, and subdirectory path. Then run
`gen.sh` and commit the results.

## Examples

These examples would be called from the bottom of `gen.sh`.

	# module <repo_name> [module_root] [module_subdir]
	#
	# go.jetify.com/axiom/pkg <- module path
	# |_________________| |_|
	#        root       subdir

	# go.jetify.com/axiom
	#
	# The root of https://github.com/jetify-com/axiom maps to the module
	# path go.jetify.com/axiom and the module is in the root (no subdir).
	module axiom

	# go.jetify.com/axiom/pkg
	#
	# The root of https://github.com/jetify-com/axiom maps to the module
	# path prefix go.jetify.com/axiom and the module is in the pkg
	# subdirectory.
	module axiom axiom pkg

	# go.jetify.com/typeid
	#
	# The root of https://github.com/jetify-com/typeid-go maps to the module
	# path go.jetify.com/typeid and the module is in the root (no subdir).
	module typeid-go typeid

See https://go.dev/ref/mod#module-path for more information on Go module paths.
