## Stack with #minimum function

Create a stack that can also return the minimum value stored in the stack. Part of the beauty of stack is that it doesn't have to keep indexes of anything. You can efficiently push and pop elements from it. One drawback is that it can't really be searched without removing elements from the stack.

### Function Signature

```ruby
stack.push(num:Fixnum) -> Fixnum
stack.pop -> Fixnum
stack.min -> Fixnum

```

### Examples

```ruby
stack.push(10)
stack.push(1)
stack.push(100)
stack.min
#=> 1
```

### Contraints

- Look at the method signatures to see what types of values we're dealing with
- You may use arrays to model the internal stack but use no array methods other than its `#push` and `#pop`
- No Enumerable methods
