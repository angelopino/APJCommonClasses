//
//  ViewController.swift
//  APJCommonClasses
//
//  Created by angelopino on 08/21/2017.
//  Copyright (c) 2017 angelopino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var examples: [ExampleType] = [.baseTableView, .baseAlert]
    var exampleTypeSelected: ExampleType!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Examples"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? BaseExamplesViewController {
            vc.type = exampleTypeSelected
        }
        
        super.prepare(for: segue, sender: sender)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return examples.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = examples[indexPath.row],
            cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = type.title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = examples[indexPath.row]
        exampleTypeSelected = type
        performSegue(withIdentifier: type.segue, sender: nil)
    }
}

