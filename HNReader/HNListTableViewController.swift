//
//  HNListTableViewController.swift
//  HNReader
//
//  Created by Boris on 04.02.15.
//  Copyright (c) 2015 Boris Musatov. All rights reserved.
//

import UIKit

class HNListTableViewController: UITableViewController, FirebaseHelperDelegate {
    
    let root = FirebaseHelper()
    let cellIdentifier = "StoryCell"
    
    var news = [Story]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        root.delegate = self
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        
        root.loadTopStories()
    }
    
    @IBAction func refresh() {
        news.removeAll(keepCapacity: false)
        root.loadTopStories()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as HNStoryTableViewCell
        cell.alpha = 0
        
        let story = news[indexPath.row]
        cell.story = story
        
        UIView.animateWithDuration(0.5, animations: {
            cell.alpha = 1
        })

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    // MARK: - FirebaseHelper callback
    
    func onRecieveData(story: Story) {
        news.append(story)
        self.tableView.reloadData()
    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showStory" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let destinationController = segue.destinationViewController as WebViewController
                let story = news[indexPath.row]
                destinationController.url = story.url
            }
        }
    }

}
