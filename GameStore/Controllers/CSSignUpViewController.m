//
//  CSSignUpViewController.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 09.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSSignUpViewController.h"

//View Model
#import "CSSignUpViewModel.h"

//Views
#import "MBProgressHUD.h"

@interface CSSignUpViewController ()

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordConfirmationTextField;

@property (weak, nonatomic) IBOutlet UIButton *signUpButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLabelTopLayoutVerticalSpaceConstraint;

@property (strong, nonatomic) CSSignUpViewModel *viewModel;

@end

@implementation CSSignUpViewController

static NSString *const CSSignInAfterLoginSegueID = @"CSAfterSignInSegueID";

- (void)viewDidLoad {
    [super viewDidLoad];
    _viewModel = [CSSignUpViewModel new];
    
    [self registerForKeyboardNotifications];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
}

#pragma mark -
#pragma mark - Actions

- (IBAction)signUpAction:(id)sender {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [self.view endEditing:YES];
    
    __weak typeof (self) wSelf = self;
    [_viewModel signUpWithCompletion:^(BOOL success, UIAlertController *alert) {
        [MBProgressHUD hideHUDForView:wSelf.view animated:YES];
        
        if (!success && alert) {
            [wSelf presentViewController:alert animated:YES completion:nil];
            
            return ;
        }
        
        [wSelf performSegueWithIdentifier:CSSignInAfterLoginSegueID sender:nil];
    }];
}

- (IBAction)textFieldTextHasChangedAction:(id)sender {
    self.viewModel.email = _emailTextField.text;
    self.viewModel.password = _passwordTextField.text;
    self.viewModel.passwordConfirmation = _passwordConfirmationTextField.text;
}

- (IBAction)tapAction:(id)sender {
    [self.view endEditing:YES];
}

#pragma mark -
#pragma mark - Notifications

- (void)registerForKeyboardNotifications {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardWillShowNotification  object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)keyboardDidShow:(NSNotification*)notification {
    CGFloat height = [[notification.userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size.height;
    CGFloat bottomSpace = CGRectGetMaxY(self.view.frame) - CGRectGetMaxY(self.signUpButton.frame);
    CGFloat keyboardButtonVerticalSpace = 10.0f;
    
    self.titleLabelTopLayoutVerticalSpaceConstraint.constant -= (height - bottomSpace + keyboardButtonVerticalSpace);
    [self.view layoutIfNeeded];
}

- (void)keyboardDidHide:(NSNotification*)notification {
    self.titleLabelTopLayoutVerticalSpaceConstraint.constant = 40;
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}

@end
