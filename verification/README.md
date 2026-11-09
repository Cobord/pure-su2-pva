# Verification

## Build and audits

From the repository root, `bash scripts/verify.sh` (Linux/macOS) or `./verify.ps1 -Serial`
(Windows):

1. checks the Lean sources against `original-lean-sha256.json` and the hash of `reference.zip`
   (see *Source hashes* below);
2. builds every default target;
3. re-runs the 20 audit files.

In `lean/`, `lake build FinalAudit` builds the main theorem and its axiom check only.
[STATUS.md](STATUS.md) records the last run.

## Frozen statement

`reference.zip` holds the original 1,046 Lean sources and the build configuration, byte for
byte; its hash and provenance are in `reference.json`. `scripts/compare_reference.py` builds it
as a separate project, exports `KhanSL2.mainStatement` together with the definitions its
statement depends on, and runs `lake comparator` against `lean/`, permitting only `propext`,
`Quot.sound` and `Classical.choice`. This checks that `lean/` proves the frozen statement.

```sh
python scripts/compare_reference.py --validate-only   # archive and configuration; Python 3.9+
python scripts/compare_reference.py                   # comparison; Linux or WSL, pinned toolchain, bubblewrap
```

`--paranoid` also requires every bundled external checker. Logs and exports go to
`.verification/`; the export is about 1 GB. `--baseline-project PATH` reuses an existing build of
the reference after checking every archived file against it. On Windows, `--prepare-only`
exports the reference and stops without comparing.

`FrozenSpecification` is not a module of `lean/`. The harness supplies it through
`--challenge-from-export`, so the project is never compared with itself.

## Kernel replay

In `lean/`, on Linux with the pinned toolchain and `bubblewrap`, `lake check` exports the default
targets and replays them; `lake check --paranoid` also runs every bundled external checker. No
replay has completed (see [STATUS.md](STATUS.md)).

References: [Lean 4.35 verification tools](https://lean-lang.org/doc/reference/latest/releases/v4.35.0/),
[comparator](https://github.com/leanprover/comparator). The pinned toolchain's built-in
`lake comparator` replaces the old standalone package.

## Source hashes

`original-lean-sha256.json` hashes the 1,046 original Lean sources. `comment-only-edits.json`
records three later edits, each confined to one block comment. The integrity scripts undo those
edits and compare with the original hashes, so every byte outside the three comments is
unchanged. `final-source-sha256.json` hashes the sources as delivered.
