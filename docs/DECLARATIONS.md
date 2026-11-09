# Paper objects and Lean declarations

Exact declaration names, with the file that defines each. The target is Theorem 1.1 of
[the paper](../paper/Pure_SU2_PVA_Proof.pdf). Conventions are in [SCOPE.md](SCOPE.md) and the
structure of the proof in [PROOF-GUIDE.md](PROOF-GUIDE.md). When a row lists several names, the
namespace of the first applies to all of them.

## Statement and fixed objects

| Mathematical role | Lean declaration | Source |
|---|---|---|
| Theorem with everything written out | `KhanSL2.mainStatement_explicit` | [Final.lean](../lean/Final.lean) |
| The theorem | `KhanSL2.mainStatement` | [MainProof.lean](../lean/MainProof.lean) |
| The proposition it proves | `KhanSL2.MainStatement` | [MainStatement.lean](../lean/KhanSL2/MainStatement.lean) |
| `phi` is bijective | `KhanSL2.phi_bijective` | [MainProof.lean](../lean/MainProof.lean) |
| Source presentation and its differential relations | `KhanSL2.SourcePresentation.Relation`, `KhanSL2.Source` | [Source.lean](../lean/KhanSL2/Source.lean) |
| Source operations; specification of the generator brackets | `KhanSL2.sourceData`, `KhanSL2.IsSourceBracket` | [SourceData.lean](../lean/KhanSL2/SourceData.lean) |
| Source bracket and its values on generators | `KhanSL2.Source.bracket`, `KhanSL2.Source.bracket_generator_formulas` | [SourceBracketQuotient.lean](../lean/KhanSL2/SourceBracketQuotient.lean) |
| PVA axioms | `KhanSL2.IsPVA` | [PVA.lean](../lean/KhanSL2/PVA.lean) |
| The source is a PVA | `KhanSL2.source_isPVA` | [SourcePVA.lean](../lean/KhanSL2/SourcePVA.lean) |
| Finite cochains, relative invariants, cycles, boundaries, cohomology | `KhanSL2.Cochain`, `relativeInvariants`, `relativeCycles`, `relativeBoundaries`, `Cohomology` | [CE.lean](../lean/KhanSL2/CE.lean) |
| The CE differential squares to zero | `KhanSL2.q_square_zero` | [CESquareZero.lean](../lean/KhanSL2/CESquareZero.lean) |
| Laws of the relative complex | `KhanSL2.relativeComplex_laws` | [CEComplex.lean](../lean/KhanSL2/CEComplex.lean) |
| Target operations, PVA laws, induced bracket | `KhanSL2.targetData`, `targetBracket`, `target_isPVA`, `target_isInduced` | [TargetPVA.lean](../lean/KhanSL2/TargetPVA.lean) |
| Cocycle classes \(\mathsf{x}\), \(\mathsf{y}\) | `KhanSL2.xClass`, `KhanSL2.yClass` | [Cocycles.lean](../lean/KhanSL2/Cocycles.lean) |
| `phi`, and well-definedness on the quotient | `KhanSL2.phi`, `KhanSL2.phi_well_defined` | [CanonicalMap.lean](../lean/KhanSL2/CanonicalMap.lean) |
| Values on generators; uniqueness | `KhanSL2.phi_X`, `phi_Y`, `phi_unique` | [CanonicalMap.lean](../lean/KhanSL2/CanonicalMap.lean) |
| `phi` as a PVA morphism | `KhanSL2.phiPVAMap` | [CanonicalMap.lean](../lean/KhanSL2/CanonicalMap.lean) |
| Isomorphism predicate for a fixed map | `KhanSL2.IsGradedDifferentialPVAIsomorphism` | [PVAIsomorphism.lean](../lean/KhanSL2/PVAIsomorphism.lean) |

## Proof

| Mathematical role | Lean declaration | Source |
|---|---|---|
| `phi` is injective | `KhanSL2.phi_injective` | [Injectivity.lean](../lean/KhanSL2/Injectivity.lean) |
| Relative CE homology and finite homogeneous duality | `KhanSL2.Current.K`, `K_finiteDimensional`, `dictionary` | [DictionaryStatement.lean](../lean/KhanSL2/DictionaryStatement.lean) |
| The transpose comparison is surjective | `KhanSL2.Current.psiK`, `psiK_apply`, `psiK_surjective` | [DictionaryStatement.lean](../lean/KhanSL2/DictionaryStatement.lean) |
| Relative affine BGG resolution | `KhanSL2.BGG.relativeBGGResolution`, `KhanSL2.BGG.relative_bgg_resolution` | [RelativeBGG.lean](../lean/KhanSL2/BGG/RelativeBGG.lean) |
| Polynomial model of the restricted source dual | `KhanSL2.Modules.sourceDualEquiv` | [SourceDualModel.lean](../lean/KhanSL2/Modules/SourceDualModel.lean) |
| Linearity over the coefficient ring | `KhanSL2.Modules.psiBLinear` | [CoefficientLinearity.lean](../lean/KhanSL2/Modules/CoefficientLinearity.lean) |
| BGG terms are finite | `KhanSL2.PolynomialBGG.bggTerm_finite` | [FiniteTerms.lean](../lean/KhanSL2/PolynomialBGG/FiniteTerms.lean) |
| BGG terms are projective | `KhanSL2.PolynomialBGG.bggTerm_projective` | [ProjectiveTerms.lean](../lean/KhanSL2/PolynomialBGG/ProjectiveTerms.lean) |
| The top BGG term is free of rank one | `KhanSL2.Conditional.topTermEquiv` | [TopRankOne.lean](../lean/KhanSL2/Conditional/TopRankOne.lean) |
| Low-degree comparison | `KhanSL2.lowDegreeStep` | [LowDegree.lean](../lean/KhanSL2/Deformation/LowDegree.lean) |
| Depth bound on the source side | `KhanSL2.Depth.depth_JB_ge` | [SourceDepth.lean](../lean/KhanSL2/Depth/SourceDepth.lean) |
| Harmonic invariants ≅ cohomology (Strong Macdonald) | `KhanSL2.StrongMacdonald.harmEquivCohom` | [Hodge.lean](../lean/KhanSL2/StrongMacdonald/Hodge.lean) |
| Harmonic invariants are free | `KhanSL2.StrongMacdonald.harm_free` | [SliceRing.lean](../lean/KhanSL2/StrongMacdonald/SliceRing.lean) |
| Symmetric coefficient shuffle | `KhanSL2.SymmetricFamily.symmetricTensorShuffle` | [SymmetricTensorShuffleProved.lean](../lean/KhanSL2/SymmetricFamily/SymmetricTensorShuffleProved.lean) |
| Künneth over two independent coefficient rings | `KhanSL2.Factorization.degreeBalancedKunnethEquiv` | [DegreeBalancedKunneth.lean](../lean/KhanSL2/Factorization/DegreeBalancedKunneth.lean) |
| Factorization of coefficient homology on coprime charts | `KhanSL2.Factorization.BGGTransfer.chartFactorizationEquiv` | [FiniteBGGChartFactorization.lean](../lean/KhanSL2/Factorization/FiniteBGGChartFactorization.lean) |
| Factorization theorem | `KhanSL2.Collision.kFactor` | [Proof.lean](../lean/KhanSL2/Collision/Proof.lean) |
| Factorization implies collision support | `KhanSL2.Collision.collisionSupportStep_of_kFactor` | [Reduction.lean](../lean/KhanSL2/Collision/Reduction.lean) |
| Main theorem from collision support | `KhanSL2.Conditional.mainStatement_of_collisionSupport` | [Assembly.lean](../lean/KhanSL2/Conditional/Assembly.lean) |
| Main theorem from factorization | `KhanSL2.Collision.mainStatement_of_kFactor` | [Completion.lean](../lean/KhanSL2/Collision/Completion.lean) |

The last three take intermediate results as hypotheses; `mainStatement` supplies them.

## Checks

[FinalAudit.lean](../lean/FinalAudit.lean) checks the type of `mainStatement_explicit` and its
axioms, and imports [MainProofAudit.lean](../lean/MainProofAudit.lean). That file checks that
`kFactor` and `mainStatement` are theorems with the expected types, and that every project
declaration in their import closure, with private proof bodies imported, uses only `propext`,
`Classical.choice` and `Quot.sound`. [verify.ps1](../lean/verify.ps1) runs the build and the 20
audit files.
