//
//  ViewController.swift
//  Aula 7
//
//  Created by Mauricio Meirelles on 9/11/14.
//  Copyright (c) 2014 Mauricio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var imagesArray: [(name: String,image: String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagesArray = [(" WATCH","img1"),("iOS 8","img2"),(" PAY","img3")]
        
    
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return imagesArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let tableViewcell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        
        tableViewcell.textLabel?.text = imagesArray[indexPath.row].name
        
        return tableViewcell;
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dtVC = segue.destinationViewController as! DetailViewController
        
        let idxPath = tableView.indexPathForCell(sender as! UITableViewCell) as NSIndexPath?
        
        dtVC.imgSelected = imagesArray[idxPath!.row].image
        
    }



}

