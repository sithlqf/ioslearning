//
//  ViewController.m
//  QuizCheat
//
//  Created by qingfeng liu on 9/27/13.
//  Copyright (c) 2013 qingfeng liu. All rights reserved.
//

#import "ViewController.h"
#import "QuestionAndAnswer.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize questionAndAnswers=_questionAndAnswers;
@synthesize selectedAnswer=_selectedAnswer;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //intialize the question and answers and store them into the array
    
    //question 1 about oceans
    QuestionAndAnswer *oceans=[[QuestionAndAnswer alloc] init];
    oceans.question=@"The Pacific Ocean is larger than the Atlantic Ocean.";
    oceans.answer=YES;
    
    //question 2 about mideast
    QuestionAndAnswer *mideast=[[QuestionAndAnswer alloc] init];
    mideast.question=@"The Suez Canal connects the Red Sea and the Indian Ocean.";
    mideast.answer=NO;
    
    //question 3 about africa
    QuestionAndAnswer *africa=[[QuestionAndAnswer alloc] init];
    africa.question=@"The source of the Nile River is in Egypt.";
    africa.answer=NO;
    
    //question 4 about americas
    QuestionAndAnswer *americas=[[QuestionAndAnswer alloc] init];
    americas.question=@"The Amazon River is the longest river in the Americas.";
    americas.answer=YES;
    
    //question 5 about asia
    QuestionAndAnswer *asia=[[QuestionAndAnswer alloc] init];
    asia.question=@"Lake Baikal is the world\'s oldest and deepest freshwater lake.";
    asia.answer=YES;
    
    //intialize the NSMutableArray
    self.questionAndAnswers=[[NSMutableArray alloc] initWithObjects:oceans,mideast,africa,americas,asia, nil];
    
    //intialize UILabel
    self.question.text=oceans.question;
    
    //set the label to auto change line to fit the text size
    [self.question setNumberOfLines:0];
    self.question.adjustsFontSizeToFitWidth=YES;
    //set the current question index
    self.currentQuestion=0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//choose the answer and store the answer and check whether it is correct
- (IBAction)trueFalseButton:(id)sender {
    UIButton *answerButton=(UIButton *)sender;
    NSInteger index=self.currentQuestion;
    QuestionAndAnswer *current=[self.questionAndAnswers objectAtIndex:index];
    NSString *judge=nil;
    
    
    if ([answerButton.titleLabel.text isEqualToString:@"True"]) {
        self.selectedAnswer=YES;
        if (current.answer!=self.selectedAnswer) {
            judge=@"wrong answer";
        }
        else
            judge=@"correct answer";
    }
    else
    {
        self.selectedAnswer=NO;
        if (current.answer!=self.selectedAnswer) {
            judge=@"wrong answer";
        }
        else
            judge=@"correct answer";
    }
    NSString *msg=[NSString stringWithFormat:@"Your answer is a %@.",judge];
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Result" message:msg delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    [alert show];
    
}

- (IBAction)cheatButtonPressed:(id)sender {
    UIActionSheet *actionSheet=[[UIActionSheet alloc] initWithTitle:@"Are you sure to do this" delegate:self cancelButtonTitle:@"No" destructiveButtonTitle:@"Show Answer" otherButtonTitles:nil];
    [actionSheet showInView:self.view];
    
}

- (void) actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if(buttonIndex !=[actionSheet cancelButtonIndex])
    {
        NSInteger index=self.currentQuestion;
        QuestionAndAnswer *current=[self.questionAndAnswers objectAtIndex:index];
        NSString *answer=nil;
        if (current.answer==YES) {
            answer=@"True";
        }
        else
            answer=@"False";
        
        NSString *msg=[NSString stringWithFormat:@"The answer is %@.",answer];
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Answer" message:msg delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        [alert show];
    }
}

- (IBAction)nextButtonPressed:(id)sender {
    NSInteger index=self.currentQuestion+1;
    
    if(index<self.questionAndAnswers.count)
    {
        self.currentQuestion=index;
        QuestionAndAnswer *next=[self.questionAndAnswers objectAtIndex:index];
        self.question.text=next.question;
    }
    else
    {
        self.currentQuestion=self.questionAndAnswers.count-1;
        NSString *msg=@"no more question";
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:msg delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
        [alert show];
    }
    
}
@end
