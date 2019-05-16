//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Thomas Hamburger on 14/11/2018.
//  Copyright © 2018 Thomas Hamburger. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!

    // Bevat de antwoorden ontvangen van QuestionViewController.
    var responses: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculatePersonalityResult()
        // Do any additional setup after loading the view.
    }

    func calculatePersonalityResult() {
        // Array om het antwoorden die bij elk AnimalType horen te tellen.
        var frequencyOfAnswers: [AnimalType: Int] = [:]
        
        // Bewaart alle type properties van responses.
        let responseTypes = responses.map { $0.type }

        // Loop door de frequencyOfAnswers dictionary, voeg key/value paar toe of tel 1 op bij de value als de key er al in staat.
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }

        // Loop door frequencyOfAnswers en zoek de AnimalType met het hoogste aantal antwoorden.
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key

        // Geef de emoji en beschrijving van de resulterende AnimalType weer.
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
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
