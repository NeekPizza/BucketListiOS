//
//  ViewController.swift
//  BucketList
//
//  Created by Nick Piazza on 1/16/17.
//  Copyright © 2017 Nick Piazza. All rights reserved.
//

import UIKit

class BucketListViewController: UITableViewController, AddItemTableViewControllerDelegate {
	
	var items = ["Go to moon","Eat a candy bar","Swim in the amazon","Own a Farrari"]

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return items.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "ListItemCell")
		cell?.textLabel?.text = items[indexPath.row]
		return cell!
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print("Selected")
	}
	
	override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
		performSegue(withIdentifier: "AddItemSegue", sender: indexPath)
	}
	
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		items.remove(at: indexPath.row)
		tableView.reloadData()
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		print(sender!)
		
		
		if ((sender as? NSIndexPath) != nil) {
			let navigationController = segue.destination as! UINavigationController
			let addItemTableController = navigationController.topViewController as!AddItemTableViewController
			addItemTableController.delegate = self
			let indexPath = sender as! NSIndexPath
			let item = items[indexPath.row]
			addItemTableController.item = item
			addItemTableController.indexPath = indexPath
			
		} else {
			let navigationController = segue.destination as! UINavigationController
			let addItemTableController = navigationController.topViewController as!AddItemTableViewController
			addItemTableController.delegate = self
		}
	}
	func cancelButtonPressed(by controller: AddItemTableViewController){
		print("inside bucket view - delegate - cancel button Pressed")
		dismiss(animated: true, completion: nil)
	}
	func itemSaved(by controller: AddItemTableViewController, with text: String, at indexPath: NSIndexPath?) {
		if let ip = indexPath{
			items[ip.row] = text
		} else {
			items.append(text)
		}

		tableView.reloadData()
		dismiss(animated: true, completion: nil)
		}
}

 
