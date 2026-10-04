# TOFIX

Findings from a code scan on 2026-10-04.

## High

- `src/org/meta/scala/core/TestObject.scala:4` - `main` has an empty body `{}`; the `println` on line 5 sits in the object body, so it runs as a side effect of object initialization rather than inside `main`. Move the `println` into `main`, drop the stray `;`, replace the tab indentation, and add the missing trailing newline (line 6).
- `rsconstruct.toml:1` - no processor compiles or checks any Scala source, so CI never notices broken demos like the one above. Add a scalac-based (or scalafmt/scalastyle) check over `src` and `standalone`.

## Medium

- `rsconstruct.toml:1` - `.luacheckrc` is present but there is no `[processor.luacheck]`, so `config/project.lua` is never linted. Add `[processor.luacheck]` with `src_dirs = ["config"]` as in pypluggy.
- `doc/installing_eclipse_with_scala_support.txt:1` - instructions target Eclipse Juno (4.2, 2012) nightly Scala-IDE and typesafe.com download links (line 13) that no longer exist; Scala IDE for Eclipse is discontinued. Replace with current tooling (sbt/scala-cli + Metals or IntelliJ) or delete the file together with `scripts/eclipse_scala.sh`.

## Low

- `scripts/source_me.sh:3` - calls `path_abs` and `path_add`, which are not defined in this repo (they come from the author's personal bash setup); document the dependency or inline plain `PATH="${SBT_HOME}/bin:${PATH}"`.
- `scripts/eclipse_scala.sh:5` - `-Xmx1524M` looks like a typo for `1536M`; the script also hardcodes `~/install/eclipse-scala` and discards all output.
- `README.md:5` - the Layout section omits `scripts/`.
- `doc/links.txt:2` - links use plain `http://`; switch to `https://` and check they still resolve.
