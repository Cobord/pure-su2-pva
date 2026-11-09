# Proof guide

```lean
theorem KhanSL2.mainStatement : KhanSL2.MainStatement :=
  KhanSL2.Collision.mainStatement_of_kFactor KhanSL2.Collision.kFactor
```

([MainProof.lean](../lean/MainProof.lean).) `Collision.kFactor` is the factorization theorem
for coefficient homology on coprime charts; `Collision.mainStatement_of_kFactor` derives the main
theorem from it. This page describes both. Declaration names and files are listed in
[DECLARATIONS.md](DECLARATIONS.md).

## The two structures and the map

The source is a quotient of a differential generators-and-relations presentation. Its bracket is
constructed on the quotient, and the super-PVA axioms are proved for it. The target is built
from finite relative CE cochains: the differential squares to zero and preserves invariants, and
cohomology inherits a product, a translation, a grading and a bracket, which satisfy the PVA
axioms.

The cocycles \(\mathsf{x}\) and \(\mathsf{y}\) satisfy the source relations, so evaluation
descends to the linear map `phi`. Its preservation laws and its uniqueness are proved first.
After that, `MainStatement` is equivalent to bijectivity of `phi`
(`mainStatement_iff_bijective`).

## Injectivity and duality

Closed Cartan chains give functionals that separate each finite source sector. Finite Taylor
comparisons and the grading extend the separation to finite sums, which proves `phi_injective`.

The chain/cochain dictionary identifies each homogeneous piece of cohomology with the dual of a
finite-dimensional piece of relative CE homology `K`. Under it, `psiK` is the transpose of `phi`,
so injectivity of `phi` gives surjectivity of `psiK`. The restricted source dual is identified
with the polynomial module `J`. The coefficient operators make `K` a module over the coefficient
ring, and the comparison `psi` is linear for these actions.

## BGG resolution, depth and induction

The relative affine A₁ BGG resolution is constructed on its induced terms, with augmentation,
exactness, energy grading, relative projectivity and relative splittings. Applying the
coefficient construction gives a finite BGG complex. Its terms are finite and projective over the
coefficient ring, and the top term is free of rank one.

The comparison is proved injective by strong induction on coefficient degree. The two lowest
degrees follow from a deformation argument. In middle degrees, the depth bound on the source side
and the support of the comparison kernel on the collision locus force the kernel to vanish.

`Conditional.mainStatement_of_collisionSupport` packages this step: it proves the main theorem
from a collision-support hypothesis, which the next step supplies.

## Factorization on coprime charts

The Strong Macdonald/Hodge development identifies the harmonic invariants and their free
generators. The `Macdonald/StrongBridge*` modules transport this model to the coefficient and
cohomology constructions above, including normalization, grading, coefficient operators and
coproducts.

Comparing the normalized symmetric coproduct with root coordinates proves the symmetric chart
quasi-isomorphism, and then `SymmetricFamily.symmetricTensorShuffle`. Specialization and finite
local filtrations carry this over to the exterior coefficient shuffle. Collisions within one
factor are allowed; the supports of the two factors are disjoint.

Finite BGG comparison and detection at complex points give the chart comparison in homology.
Künneth is applied over the two independent coefficient rings, with the flatness it needs, before
the mixed coefficient actions are balanced. The result is `chartFactorizationEquiv`, and from it
`Collision.kFactor`.

## Assembly

The factorization of `K`, together with the factorization of `J`, gives collision support for
the comparison kernel. The induction above then proves the comparison injective. Homogeneous
duality turns this into surjectivity of `phi`. With injectivity and the morphism laws, that is
`MainStatement`.

```text
Strong Macdonald / Hodge
  -> symmetric shuffle
  -> exterior shuffle and finite BGG chart comparison
  -> Kunneth compatible with the coefficient actions
  -> KFactor
  -> collision support
  -> depth / deformation induction
  -> phi bijective
  -> MainStatement
```
