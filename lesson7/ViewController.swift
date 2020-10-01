//
//  ViewController.swift
//  lesson7
//
//  Created by macbook on 01.10.2020.
//  Copyright © 2020 Iskander Nizamov. All rights reserved.
//
enum UnviversityCalculatingError: Error {
    
    case divideByZero
    case moreThanFive
}

class Student {
    let name: String
    let score: Int
    
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
}

class University {
    var students = [Student]()
    
    var averageScore = 0
    func averageScores() throws -> Int {
        guard students.count > 0 else { throw UnviversityCalculatingError.divideByZero}
        for student in students {
            averageScore += student.score
        }
        averageScore = averageScore / students.count
        guard averageScore > 5 else { throw UnviversityCalculatingError.moreThanFive}
        return (averageScore)
    }
    
    init(_ students: [Student]) {
        self.students = students
    }
}





import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let university1 = University([])
        do { try print (university1.averageScores())}
        catch UnviversityCalculatingError.divideByZero {
            print ("Студенты еще не поступили в университет")
        }
        catch UnviversityCalculatingError.moreThanFive {
            print ("Кто-то из студентов получает 6-ки")
        }
        catch _ {
            print ("Произошло что то совсем невообразимое")
        }
    }


}

