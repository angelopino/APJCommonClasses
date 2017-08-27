//
//  BaseTableViewViewController.swift
//  APJCommonClasses
//
//  Created by Pino, Angelo on 21/08/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import APJCommonClasses

class BaseTableViewViewController: BaseExamplesViewController {

    @IBOutlet weak var apjTableView: APJTableView!
    
    var data = ["Rome", "Milan", "Naples", "Turin", "Palermo", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas quis euismod lacus, et accumsan urna. Etiam arcu neque, ornare ut molestie in, dictum ac libero. Nullam quis consequat neque. Curabitur hendrerit auctor dignissim. Nulla facilisi. Vivamus molestie sem ac pretium iaculis. Morbi blandit augue vel tempor dapibus. Nam volutpat tellus eget turpis pellentesque, ac gravida eros eleifend. Phasellus id maximus sem, a maximus ex. Pellentesque consectetur ex et malesuada rhoncus. Pellentesque vehicula lectus pretium porta porta. Sed hendrerit cursus lacus, et tristique lorem vulputate in. Nullam sed sapien sit amet nulla scelerisque dapibus condimentum vitae nisi.", "Bologna", "Florence", "Bari", "Cras lectus justo, volutpat a ligula eget, ullamcorper lobortis libero. Phasellus ac arcu eget justo finibus ullamcorper accumsan efficitur risus. Vivamus cursus sollicitudin sapien et ultricies. Mauris pharetra velit id elementum tincidunt. Nulla eget ornare risus, nec blandit risus. Aliquam erat volutpat. Donec cursus, tortor a feugiat rhoncus, risus sem molestie ligula, ut pellentesque turpis diam sed purus. Proin semper enim nunc, a euismod est accumsan at. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris magna ex, maximus ut posuere eget, faucibus eget nisi. Praesent bibendum quis quam id ultricies. Vivamus sollicitudin mauris eu risus viverra consequat.", "Venice"]
    override func viewDidLoad() {
        super.viewDidLoad()
        apjTableView.wrapDelegate = self
        initTableView(apjTableView)
    }

}

extension BaseTableViewViewController: APJTableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath),
            text = data[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = text
        return cell
    }
    
}
