Phase 1 Cheatsheet
=================
This is a quick reference to all the stuff we touched upon in Phase 1
##General Tips
#### MVP: *minimum* viable product
Only implement the features to spec, *nothing* more. Otherwise you are wasting precious time.
#### WWSMD: What Would Sandi Metz Do?
Are your methods only doing one thing?
#### Refactor, Refactor, Refactor
Okay, your code works. But is this the best, most elegant implementation? Are there any enumerable methods that makes your code more readable?

##Enumerables
#### `all?` and `any?`
Given a block, `all?` will return `true` if *all* the elements of an enumerable evaluates to true or truthy.
``` ruby
array = [2, 4, 6, 8, 10]
array.all? { |ele| ele % 2 == 0 } #=> true
array.all? { |ele| ele % 3 == 0 } #=> false
array.all?(&:even?)               #=> true
```
Given a block, `any?` will return `true` if *any* the elements of an enumerable evaluates to true or truthy.
``` ruby
array = [2, 4, 5, 6, 8, 10]
array.any? { |ele| ele % 2 == 0 } #=> true
array.any? { |ele| ele % 3 == 0 } #=> true
array.any? { |ele| ele % 7 == 0 } #=> false
array.any?(&:odd?)                #=> true
```
