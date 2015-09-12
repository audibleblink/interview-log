## Implement a Set

A [Set](http://ruby-doc.org/stdlib-2.2.3/libdoc/set/rdoc/Set.html) is a data structure that holds information but does not allow repeats.

### Function Signature

```ruby
my_set.push(data:Any) -> Boolean
```

### Examples

```ruby
my_set.push("foo") -> true
my_set.push("foo") -> false
```

### Contraints

- `#push` must perform in constant-time: O(1)
