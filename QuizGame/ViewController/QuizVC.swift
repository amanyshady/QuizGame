//
//  QuizVC.swift
//  QuizGame
//
//  Created by Amany Shady on 26/02/2023.
//

import UIKit

class QuizVC: UIViewController {
    
    @IBOutlet weak var backBtn: UIButton!
    
    @IBOutlet weak var nextBtn: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var questionLbl: UILabel!
    
    
    var viewModel : StartVM?
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        setQuesLblData()
        initVM()
    
    }
    
    func initVM() {
        
        viewModel?.selectCorrectAnswer.bind { [weak self] correctAnswer in
            
            guard let correctAnswer = correctAnswer else {return}
            
            var alertMsg = ""
            
            if correctAnswer {
               
                alertMsg = "Correct Answer"
            }else {
                
                alertMsg = "Wrong Answer"
            }
            
            let alert = UIAlertController(title: "Alert!", message: alertMsg, preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self?.present(alert, animated: true)
        }
    }
    
    func setQuesLblData() {
       
        guard let viewModel = self.viewModel else {return}
        
      let questionTxt = viewModel.getQuesLabelTxt()
        
        self.questionLbl.text = questionTxt
    }
    
    
    
    
    @IBAction func selectQuestAction(_ sender: UIButton) {
        
        switch sender.tag {
        case 0 : // back btn
            
            if viewModel!.questionSelected >= 1 {
                viewModel?.decreaseQuestionSelected()
                setQuesLblData()
                tableView.reloadData()
            }
            
            
    
            break
        case 1 : // next btn
          
            
            guard let viewModel = self.viewModel else {return}
            if viewModel.questionSelected < (viewModel.getAllQuestionsNumCount() - 1 ) {
                viewModel.increaseQuestionSelected()
                setQuesLblData()
                tableView.reloadData()
            }
            
            
         break
        default:
            print("no button selected")
        }
    }
    
    

}

extension QuizVC : UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let viewModel = self.viewModel else {return Int()}
           
        return viewModel.getSelectedOptionAnswersCount()
    
      
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "optionQuesCell", for: indexPath) as! QuizTableViewCell
        
        
        guard let viewModel = self.viewModel else {return QuizTableViewCell()}
        
        
        cell.quizeOptionData  = viewModel.getSelectedOptionAnswers(index: indexPath.row)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
       
        
        viewModel?.userSelectAnswer(selectedAnswer: indexPath.row)
        
    }
    
    
}
