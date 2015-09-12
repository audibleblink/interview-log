## Brace Checker

Implement a function that can tell us whether or not a given string of code has valid matching braces `()[]{}`


### Function Signature

```ruby
brace_checker(text:String) -> Boolean
```

### Examples

```ruby
brace_checker("[()]{}") -> true
brace_checker("]foo))") -> false
```

### Constraints

- None

### Stretch

Account for quotes in our text as well
  - what should happen if there are brackets between quotes?
