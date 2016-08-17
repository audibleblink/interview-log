//simpler version checking only for parens
function badBraces(string) {

  let stack = [] 
  let parenDefs = { ")": "(" }

  string.split('').forEach((el) => {
    let last = stack[stack.length - 1]

    if (el === '(' || el === ')') {

      if (el === ')' && last === parenDefs[el]) {
        stack.pop()
      } else {
        stack.push(el)
      }
    } 
  })

  return stack.length
}

console.log(badBraces(')ahe(') === 2)
console.log(badBraces('(abc)') === 0)
console.log(badBraces('(ac))') === 1)
