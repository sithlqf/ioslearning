//
//  ViewController.h
//  QuizCheat
//
//  Created by qingfeng liu on 9/27/13.
//  Copyright (c) 2013 qingfeng liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *question;

//user defined variables
//store the chosen answer
@property BOOL selectedAnswer;
//store the QuestionAndAnswer object
@property (strong, nonatomic) NSMutableArray *questionAndAnswers;

//store the index of current question
@property NSInteger currentQuestion;


- (IBAction)trueFalseButton:(id)sender;

- (IBAction)cheatButtonPressed:(id)sender;
- (IBAction)nextButtonPressed:(id)sender;

@end
