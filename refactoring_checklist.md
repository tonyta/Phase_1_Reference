

1. DRY it up. Are you repeating code? If so, extract a method!

2. Check your enumerables. If you are using .each, check the documentation for a better method.

3.Single responsibility: if a method is doing more than one thing, extract a method.

4. Law of Demeter: Your objects should only be talking to their immediate neighbors.
   If you have Groves and Trees and Fruits, Groves should not be talking to Fruits.

5. Check your dependencies. How much do each of your objects know about the others?
