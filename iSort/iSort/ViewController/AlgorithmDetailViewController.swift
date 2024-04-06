//
//  AlgorithmDetailViewController.swift
//  iSort
//
//  Created by Antonio Abbatiello on 03/04/24.
//

import UIKit
import SwiftUI

class AlgorithmDetailViewController: UIViewController {
    
    var algorithm: Algorithm?
    
    @IBOutlet weak var complexityLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var sortingTimeLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let algo = algorithm {
            complexityLabel.text = algo.complexity
            descriptionLabel.text = algo.description ?? "No description"
            self.navigationItem.title = algo.name
        }
        
    }
    
    required init?(coder: NSCoder, algorithm: Algorithm?) {
        self.algorithm = algorithm
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    @IBSegueAction func animatedAlgorithm(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: AlgorithmAnimation(algorithm: self.algorithm!))
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        Task {
            let size = algorithm?.complexity == "O(nlogn)" ? 1_000_000 : 10_000
            self.sortingTimeLabel.text = "Sorting \(size.formatted()) elements..."
            if let algorithmName = algorithm?.name as? String {
                self.sortingTimeLabel.text = await selectAlgorithm(algorithmName, size: size)
            }
        }
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
