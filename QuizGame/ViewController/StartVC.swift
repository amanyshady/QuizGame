//
//  StartVC.swift
//  QuizGame
//
//  Created by Amany Shady on 22/02/2023.
//

import UIKit

class StartVC: UIViewController {
    
    
    @IBOutlet weak var startQuizBtn: UIButton!
    
      let viewModel : StartVM
    
    
      init(viewModel : StartVM) {
        
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.viewModel = StartVM()
        super.init(coder: coder)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    
    @IBAction func startQuizAction(_ sender: UIButton) {
        
        viewModel.fetchQuizQuest()
        
    }
    
}

