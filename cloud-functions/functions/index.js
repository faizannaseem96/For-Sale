const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp(functions.config().firebase)

exports.announceProduct = functions.database
	.ref('products/{productId}')
	.onWrite(( change,context) => {
		let product = change.after.val()
		sendNotification(product)
})


function sendNotification(product) {
	let title = product.title
	let cost = product.cost
	let payload = {
		notification: {
			title: 'New Product Available',
			body: title + ' for $' + cost,
			sound: 'default' ,
			mutable_content: 'true'
		},
		data: {
			imageUrl : 'https://static3.cilory.com/273124-thickbox_default/nologo-navy-casual-shirt.jpg'
		}
	}
	console.log(payload);

	let topic = "newProduct"
	admin.messaging().sendToTopic(topic, payload)
}