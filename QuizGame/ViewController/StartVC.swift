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
        
        initVM()
        
    }

    func initVM() {
        
        viewModel.quizQuesList.bind { [weak self] _ in
            
            guard let quizList = self?.viewModel.quizQuesList.value else {return}
            
            if quizList.count > 0 {
                
               
                guard let quizVc = self?.storyboard?.instantiateViewController(withIdentifier: "QuizVC") as? QuizVC else{return}
                 
                quizVc.viewModel = self?.viewModel
                
                self?.navigationController?.pushViewController(quizVc, animated: true)
            }
        }
    }
    
    
    
    
    @IBAction func startQuizAction(_ sender: UIButton) {
        
        viewModel.fetchQuizQuest()
        
    }
    
}

