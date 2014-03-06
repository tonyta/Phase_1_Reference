Phase 1 Cheatsheet
=================
This is a quick reference to all the stuff we touched upon in Phase 1
##Enumerables
### `all?` and `any?`
Given a block, `all?` will return `true` if *all* the elements of an enumerable evaluates to true or truthy.
``` ruby
arr = [2, 4, 6, 8, 10]
arr.all? { |ele| ele % 2 == 0 } #=> true
arr.all?(&:even?)               #=> true
```

Given a block, `any?` will return `true` if *any* the elements of an enumerable evaluates to true or truthy.
