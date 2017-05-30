//
//  ViewController.swift
//  IdeaCollector
//
//  Created by admin on 30/05/2017.
//  Copyright © 2017 Alex Keaveney. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var ideaTableView: UITableView!
    
    var ideas : [Idea] = []
    
    override func viewWillAppear(_ animated: Bool) {
        
        //get core data
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            ideas = try context.fetch(Idea.fetchRequest())
            ideaTableView.reloadData()
            print(ideas)
        }
        catch {
            print("Could not find ideas")
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ideaTableView.delegate = self
        ideaTableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = ideas[indexPath.item].title
        cell.imageView?.image = UIImage(data: ideas[indexPath.item].image as! Data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ideas.count
    }



}

