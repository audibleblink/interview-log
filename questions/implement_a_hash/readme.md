## Implement a Ruby's Hash

Ruby's hash maintains a constant-time lookup, O(1), by hashing keys and placing them in buckets in an array. If I look for the key `:foo` inside of `myhash` like this: `myhash[:foo]`, `foo` is converted to a number, or hash, and placed in a bucket based on that number. When I ask to read `:foo`, Ruby will once again convert it to a hashed number. Ruby knows exactly where to look for that hashed number, so it goes and retrieves it.

### Function Signature

```ruby
# write
my_hash[key:Symbol] = Any -> Any
# read
my_hash[key:Symbol] -> Any
```


### Constraints

- Must perform in constant-time: O(1)
- A write that triggers a resize can be O(n)

### Stretch
- Implement resizing to avoid collisions as the Hash fills up
