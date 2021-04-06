{ name = "cnchar"
, dependencies = [ "options", "prelude", "psci-support", "spec" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
