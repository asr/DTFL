------------------------------------------------------------------------------
-- Mathematical induction
------------------------------------------------------------------------------

{-# OPTIONS --exact-split    #-}
{-# OPTIONS --guardedness    #-}
{-# OPTIONS --no-sized-types #-}
{-# OPTIONS --safe           #-}
{-# OPTIONS --warning=all    #-}
{-# OPTIONS --warning=error  #-}
{-# OPTIONS --without-K      #-}

module Extra.Data.Nat.Induction.MathematicalInduction where

open import Data.Nat renaming (suc to succ)

------------------------------------------------------------------------------
-- Induction principle on natural numbers (mathematical induction)

-- Let P be an predicate, then

--   P 0             ∀ x. P x → P (succ x)
-----------------------------------------------
--           ∀ x. P x

-- Agda formalization:
-- * Higher-order function
-- * Dependent types
-- * We have a proof of mathematical induction!

indℕ : (P : ℕ → Set) →
       P zero →
       (∀ n → P n → P (succ n)) →
       ∀ n → P n
indℕ P P0 istep zero     = P0
indℕ P P0 istep (succ n) = istep n (indℕ P P0 istep n)
