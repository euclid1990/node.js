const product = require('product')
const order = require('order')
const numberOfProduct = 10
const orderProductNumber = 2
console.log(`Init ${numberOfProduct} product in Stock`)
product.init(numberOfProduct)
console.log(`Let create order with ${orderProductNumber} product`)
order.create(orderProductNumber)
console.log('Directly get total product in product module:', product.get())
console.log('Get total product via order module:', order.getLeftProduct())
