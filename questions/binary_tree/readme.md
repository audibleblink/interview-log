## Implement a Binary Tree

In computer science, a [binary tree](https://en.wikipedia.org/wiki/Binary_tree) is a tree data structure in which each node has at most two children, which are referred to as the left child and the right child

Implement a recursive search that returns true or false if the number is found or not found, respectively.

### Function Signature

```ruby
my_tree.insert(number:Number)
my_tree.find(number:Number) -> Boolean
```

### Examples

```ruby
my_set.insert(42) -> true
my_set.insert(41) -> true
my_set.insert(44) -> true

my_tree.find(43) -> false
my_tree.find(42) -> true
```

### Contraints

- The search complexity must be Ologn
