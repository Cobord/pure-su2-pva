# Verification status

The native build and all 20 audit files passed. After three comment-only corrections, all
default targets were rebuilt and `FinalAudit` passed at 2026-10-27T13:46:20.3346214Z.

`#print axioms KhanSL2.mainStatement` reports `propext`, `Classical.choice` and `Quot.sound`.
`MainProofAudit` checks the same for all 20,655 project declarations in the import closure, with
private proof bodies imported. `FinalAudit` checks `KhanSL2.mainStatement_explicit`.

| Check | Result | Evidence |
|---|---|---|
| Native build and 20 audit files | Passed | [native-build.log](native-build.log) |
| Rebuild of all default targets after the comment corrections | Passed | [final-source-build.log](final-source-build.log) |
| Type and axioms of `mainStatement_explicit` | Passed | [FinalAudit.lean](../lean/FinalAudit.lean), final-source-build.log |
| Original sources unchanged outside three block comments | Passed | [comment-only-edits.json](comment-only-edits.json), integrity scripts |
| `reference.zip` and comparator configuration | Validated | [reference.json](reference.json) |
| Export of the frozen theorem and its dependencies | Passed | [results.json](results.json) |
| Native replay of the export | Inconclusive: no verdict after 300 s | [results.json](results.json) |
| Sandboxed comparator | Not run (needs Linux) | [README.md](README.md) |
| All bundled external kernels | Not run | `--paranoid` |

Of the 1,046 original Lean files, 1,043 are byte-identical and three differ inside one block
comment each. `Final.lean` and `FinalAudit.lean` are new. Hashes of the delivered sources are in
[final-source-sha256.json](final-source-sha256.json). The build reused Lake's cache. The full audit
run finished at 2026-10-27T13:39:13.6463127Z, before the comment corrections and the final rebuild.

Some audit files print intermediate lemmas that take hypotheses; `mainStatement` discharges all
of them.
