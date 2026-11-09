module

public import KhanSL2.Modules.ModeShifts

@[expose] public section

/-! Commutation relations of the coefficient-mode lowering derivations `lowerB m`, the
operators `T_m` of the paper's equation (2.9):

* `lowerB_lowerB`: `[T_m, T_n] = 0`;
* `lowerB_q`: `[T_m, Q] = 0` on all cochains, not only on invariants;
* `lowerB_colorAction`: `[T_m, L_a] = 0`.

Each is checked on generators and extended by the Leibniz rule. -/

noncomputable section
namespace KhanSL2.Modules

/-- Two even derivations of the cochain algebra commute if they commute on generators. -/
private theorem even_derivations_commute (D E : Module.End ℂ Cochain)
    (D1 : D 1 = 0) (E1 : E 1 = 0)
    (Dmul : ∀ u v, D (u * v) = D u * v + u * D v)
    (Emul : ∀ u v, E (u * v) = E u * v + u * E v)
    (hcomm : ∀ v, D (E (generator v)) = E (D (generator v))) (u : Cochain) :
    D (E u) = E (D u) := by
  induction u using cochain_induction with
  | hzero => simp
  | hone =>
    change D (E 1) = E (D 1)
    rw [D1, E1, map_zero, map_zero]
  | hadd u v hu hv => simp only [map_add, hu, hv]
  | hsmul r u hu => simp only [map_smul, hu]
  | hgen v u hu =>
    change D (E (generator v * u)) = E (D (generator v * u))
    simp only [Emul, Dmul, map_add, hcomm, hu]
    abel

private theorem lowerB_lowerB_generator (m n : ℕ) (v : Mode) :
    lowerB m (lowerB n (generator v)) = lowerB n (lowerB m (generator v)) := by
  cases v with
  | c j a => simp [lowerBGenerator]
  | b j a =>
    simp only [lowerB_generator, lowerBGenerator, apply_ite (lowerB m), apply_ite (lowerB n),
      map_zero]
    split_ifs <;> first | rfl | (exfalso; omega) | (congr 2; omega)

/-- `[T_m, T_n] = 0`. -/
theorem lowerB_lowerB (m n : ℕ) (u : Cochain) :
    lowerB m (lowerB n u) = lowerB n (lowerB m u) :=
  even_derivations_commute (lowerB m) (lowerB n) (lowerB_one m) (lowerB_one n) (lowerB_mul m) (lowerB_mul n)
    (lowerB_lowerB_generator m n) u

private theorem lowerB_colorAction_generator (m : ℕ) (a : Fin 3) (v : Mode) :
    lowerB m (colorAction a (generator v)) = colorAction a (lowerB m (generator v)) := by
  cases v with
  | c j b => simp [colorGenerator, lowerBGenerator, Mode.recolor, map_sum]
  | b j b =>
    by_cases h : m ≤ j <;>
      simp [h, colorGenerator, lowerBGenerator, Mode.recolor, Mode.color, map_sum]

/-- `[T_m, L_a] = 0`. -/
theorem lowerB_colorAction (m : ℕ) (a : Fin 3) (u : Cochain) :
    lowerB m (colorAction a u) = colorAction a (lowerB m u) :=
  even_derivations_commute (lowerB m) (colorAction a) (lowerB_one m) (extendDerivation_one _) (lowerB_mul m)
    (colorAction_mul a) (lowerB_colorAction_generator m a) u

/-- `T_m` applied to the bracket terms `∑ ε_{abc} c_i^b ∧ b_k^c` of `Q b_j^a`. -/
private theorem lowerB_bracketTerm (m i k : ℕ) (a : Fin 3) :
    lowerB m (∑ b : Fin 3, ∑ c : Fin 3,
        epsilon a b c • wedge (generator (.c i b)) (generator (.b k c))) =
      if m ≤ k then
        ∑ b : Fin 3, ∑ c : Fin 3,
          epsilon a b c • wedge (generator (.c i b)) (generator (.b (k - m) c))
      else 0 := by
  by_cases hk : m ≤ k <;>
    simp [hk, map_sum, ← cochain_mul_eq_wedge, lowerB_mul, lowerBGenerator]

private theorem lowerB_q_generator (m : ℕ) (v : Mode) :
    lowerB m (q (generator v)) = q (lowerB m (generator v)) := by
  cases v with
  | c j a =>
    rw [q_generator, lowerB_generator]
    simp [qGenerator, lowerBGenerator, map_sum, ← cochain_mul_eq_wedge, lowerB_mul]
  | b j a =>
    rw [q_generator, lowerB_generator]
    simp only [qGenerator, lowerBGenerator]
    rw [map_neg, map_sum]
    simp only [lowerB_bracketTerm]
    by_cases h : m ≤ j
    · rw [ite_eq_left h, q_generator]
      simp only [qGenerator]
      congr 1
      rw [← Finset.sum_filter]
      apply Finset.sum_congr
      · ext i
        simp only [Finset.mem_filter, Finset.mem_range]
        omega
      · intro i _
        rw [show j - 1 - i - m = j - m - 1 - i by omega]
    · rw [ite_eq_right h, map_zero, neg_eq_zero]
      exact Finset.sum_eq_zero fun i hi =>
        ite_eq_right (by simp only [Finset.mem_range] at hi; omega)

/-- `[T_m, Q] = 0` on all cochains. -/
theorem lowerB_q (m : ℕ) (u : Cochain) : lowerB m (q u) = q (lowerB m u) := by
  induction u using cochain_induction with
  | hzero => simp
  | hone =>
    change lowerB m (q 1) = q (lowerB m 1)
    rw [lowerB_one, map_zero, show q 1 = 0 from extendDerivation_one _, map_zero]
  | hadd u v hu hv => simp only [map_add, hu, hv]
  | hsmul r u hu => simp only [map_smul, hu]
  | hgen v u hu =>
    change lowerB m (q (generator v * u)) = q (lowerB m (generator v * u))
    have hpar : cochainParity (lowerB m (generator v)) = -lowerB m (generator v) := by
      rw [lowerB_generator]
      exact lowerBGenerator_parity m v
    simp only [q_mul, lowerB_mul, map_add, cochainParity_generator, map_neg, hpar,
      lowerB_q_generator, hu, neg_mul]
    abel

end KhanSL2.Modules
