
function sumSquared(number) {
  var factors = factorsFor(number)
  return factors
    .map(function(el) {
      // returns an array with all elements of factors, squared
      return el * el
    })
    .reduce(function(memo, el) {
      // returns the memo at the end of the iteration
      return memo + el
    })
}

function factorsFor(num) {
  var factors = [];
  for (var pf = 0; pf <= Math.sqrt(num); pf++) {
    if (num % pf == 0) {
      // If we can find a lower factor, we can infer its
      // inverse factor by dividing num by the lower factor.
      // Because of this, we only ever need to iterate upto
      // the square root of n, making this O(log n)
      factors.push(pf)

      // Make sure perfect squares are not pushed twice.
      if (pf !== num / pf) {
        factors.push(num / pf)
      }
    }
  }
  return factors
}

console.log(
  "Returns a number's factors, squared and summed:\n",
  sumSquared(12) === 210
);
