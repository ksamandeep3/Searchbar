//
//  SearchViewController.swift
//  SearcBar
//
//  Created by MacStudent on 2020-01-15.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    var searchResults = [String]()
    
     @IBOutlet weak var searchBar: UISearchBar!
     @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
extension SearchViewController: UISearchBarDelegate {
    
func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
{
    searchResults = []
    for i in 0...2 {
    searchResults.append(String(format:
    "Fake Result %d for '%@'", i, searchBar.text!))
    }
    tableView.reloadData()
//print("The search text is: '\(searchBar.text!)'")
    
}
    
}

extension SearchViewController: UITableViewDelegate,UITableViewDataSource
{

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return searchResults.count}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   let cellIdentifier = "SearchResultCell"
    var cell:UITableViewCell! = tableView.dequeueReusableCell(
                                withIdentifier: cellIdentifier)
    if cell == nil {
    cell = UITableViewCell(style: .default,reuseIdentifier: cellIdentifier)
    }
    
    cell.textLabel!.text = searchResults[indexPath.row]
    return cell
}

}
