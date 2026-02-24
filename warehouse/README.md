# warehouse

The analogy in [my Medium article](https://medium.com/gitconnected/what-is-a-monad-in-non-technical-terms-b22640cfd993) converted to Haskell.

Each kind of container type defined here is like the `Maybe` type, only with certain typeclass implementations missing.

- A package only implements the `Functor` typeclass.
- A pod only implements the `Functor` and `Applicative` typeclasses.
- A SuperPod implements the `Functor`, `Applicative`, and `Monad` typeclasses.
