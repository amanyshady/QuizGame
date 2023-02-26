//
//  QuizTableViewCell.swift
//  QuizGame
//
//  Created by Amany Shady on 26/02/2023.
//

import UIKit

class QuizTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var quizItemView: UIView!
    
    @IBOutlet weak var quizLbl: UILabel!
    
    var quizeOptionData : OptionAnsItem? {
        
        didSet {
            
            quizLbl.text = quizeOptionData?.answerTxt
            quizLbl.tag = quizeOptionData!.id
            
            
        }
    }
    
    
    
    override func layoutSubviews() {
        
        self.quizItemView.roundedBoarder()
    }

   

}
