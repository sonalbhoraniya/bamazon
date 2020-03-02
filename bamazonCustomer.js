var mysql = require('mysql');
var inquirer = require('inquirer');
var express = require('express');

// mySQL connection
var connection = mysql.createConnection({
	host: "localhost",
	port: "3306",
	user: "root",
	password: "password",
	database: "bamazon_db"
});

connection.query("SELECT * FROM products", function (err, res) {
	if (err) throw err;
	for (var i = 0; i < res.length; i++) {
		console.table(res[i]);
	}

	prompt(); 
});

function prompt() {

	inquirer.prompt([{
		name: "itemid",
		type: "input",
		message: "What is the ID of the product that you would like to buy?"
	},
	{
		name: "quantity",
		type: "input",
		message: "How many units of this product would you like to buy?"
	}
	]).then(function (answers) {

		connection.query('SELECT * FROM products WHERE ?', { item_id: answers.itemid }, function (err, res) {
			if (err) throw err;

			if (res[0].stock_quantity > answers.quantity) {

				var cost = res[0].price * answers.quantity
				console.log("-----------------------------------");
				console.log("It's your lucky day, we have this in stock! \nThe total cost is $" + cost.toFixed(2))

				var newQuantity = res[0].stock_quantity - answers.quantity

				connection.query("UPDATE products SET ? WHERE ?", [{
					stock_quantity: newQuantity
				},
				{
					product_name: answers.itemid
				}],

					function (err, res) {
					});

				restart();
			}
			else {
				console.log("-----------------------------------");
				console.log("Bummer, you can't buy this many. \nWe only have " + res[0].stock_quantity + " units of " + res[0].product_name)
				restart();
			}
		})
	})
}

function restart() {
	inquirer.prompt([{
		name: "playagain",
		type: "confirm",
		message: "Would you like to play again (Y/n)?"
	}
	]).then(function (answers) {
		if (answers.playagain) {
			prompt();
		}
		else {
			connection.end();  
		}
	})
}