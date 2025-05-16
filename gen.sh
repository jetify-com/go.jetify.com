#!/bin/bash

set -e

module() {
	# See https://go.dev/ref/mod#module-path
	local github_repo_name="$1"
	local module_root="${2:-$github_repo_name}"
	local module_subdir="$3"
	local module_path="${module_root}${module_subdir:+/$module_subdir}"

	mkdir -p "$module_path"
	cat <<- EOF > "$module_path/index.html"
		<!doctype html>
		<html lang="en">

		<head>
		    <title>go.jetify.com/$module_path</title>
		    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		    <meta name="go-import" content="go.jetify.com/$module_root git https://github.com/jetify-com/$github_repo_name">
		    <meta http-equiv="refresh" content="0; url=https://github.com/jetify-com/$github_repo_name">
		</head>

		<body>
		    Redirecting to <a href="https://github.com/jetify-com/$github_repo_name">github.com/jetify-com/$github_repo_name</a>
		</body>

		</html>
	EOF
}

# module <repo_name> [module_root] [module_subdir]

module ai                     # go.jetify.com/ai
# The axiom root is not a real module, but it's needed to make modules in
# subdirectories work.
module axiom                  # go.jetify.com/axiom
module axiom axiom api        # go.jetify.com/axiom/api
module axiom axiom launchpad  # go.jetify.com/axiom/launchpad
module axiom axiom opensource # go.jetify.com/axiom/opensource
module axiom axiom pkg        # go.jetify.com/axiom/pkg
module axiom axiom testpilot  # go.jetify.com/axiom/testpilot
module devbox                 # go.jetify.com/devbox
module envsec                 # go.jetify.com/envsec
module launchpad              # go.jetify.com/launchpad
module pkg                    # go.jetify.com/pkg
module typeid-go typeid       # go.jetify.com/typeid
module tyson                  # go.jetify.com/tyson
