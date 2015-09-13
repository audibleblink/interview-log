var usd = {
  'quarter': 25,
  'dime'   : 10,
  'nickel' : 5 ,
  'penny'  : 1 ,
}

function makeChange(currencyKey){

  return function(coinAmount){

    return Object.keys(currencyKey).reduce(function(memo, coinName){

      var coinValue = currencyKey[coinName]
        , coinCount = Math.floor(coinAmount / coinValue)
        , coinArray = Array.apply(0,Array(coinCount))
                      .map(function(el){return coinValue})

      coinAmount = coinAmount % coinValue
      return memo.concat(coinArray)
    }, [])

  }
}


var makeUSChange = makeChange(usd)

console.log(
  "Returns the correct change for 89 cents:\n",
  makeUSChange(89).toString() === [ 25, 25, 25, 10, 1, 1, 1, 1 ].toString()
);
