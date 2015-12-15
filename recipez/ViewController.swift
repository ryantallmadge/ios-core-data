//
//  ViewController.swift
//  recipez
//
//  Created by Ryan Tallmadge on 12/15/15.
//  Copyright © 2015 ryant. All rights reserved.
//

import UIKit
import CoreData;

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var recipes = [Recipe]();
    
    //var fetchedResultsController : NSFetchedResultsController!;
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("RecipeTableViewCell") as? RecipeTableViewCell {
            let recipe = recipes[indexPath.row];
            cell.configureCell(recipe);
            return cell
        }else{
            return RecipeTableViewCell();
        }
    }
    
    func fetchAndSetResults() {
        let app = UIApplication.sharedApplication().delegate as! AppDelegate;
        let context = app.managedObjectContext;
        let fetchRequest = NSFetchRequest(entityName: "Recipe");
        
        do {
            let results = try context.executeFetchRequest(fetchRequest);
            self.recipes = results as! [Recipe];
        } catch let err as NSError {
            print(err.debugDescription);
        }
        
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self;
        tableView.dataSource = self;
    }
    
    override func viewDidAppear(animated: Bool) {
        fetchAndSetResults();
        tableView.reloadData();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

