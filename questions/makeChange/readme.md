## Make Change

Given a value under 100 (cents), return the minimum amount of coins that represent that value.

### Function Signature

```js
makeChange(input:Number) -> [Number]
```

### Examples

```ruby
makeChange(89) -> [25, 25, 25, 10, 1, 1, 1, 1]
makeChange(4)  -> [1, 1, 1, 1]
```

### Constraints

None

### Stretch

Currying: Create a function that takes a currency map and returns a function that uses that map to make change.

```js
var makeUSChange = makeChange(usDollarMap)
makeUSChange(89)
// > [25, 25, 25, 10, 1, 1, 1, 1]
```
