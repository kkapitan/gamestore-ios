//
//  CSSignInViewController.m
//  GameStore
//
//  Created by Krzysztof Kapitan on 09.04.2016.
//  Copyright © 2016 Cappsoft. All rights reserved.
//

#import "CSSignInViewController.h"

//View Model
#import "CSSignInViewModel.h"

//Views
#import "MBProgressHUD.h"

//Categories
#import "UIAlertController+Errors.h"


@interface CSSignInViewController ()

@property (nonatomic, strong) CSSignInViewModel *viewModel;

@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (weak, nonatomic) IBOutlet UIButton *signInButton;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLabelTopLayoutGuideVerticalSpaceConstraint;

@end

@implementation CSSignInViewController

static NSString *const CSSignInAfterLoginSegueID = @"CSAfterSignInSegueID";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _viewModel = [CSSignInViewModel new];
    
    [self registerForKeyboardNotifications];
    
#ifdef DEBUG
    self.emailTextField.text = @"example@marketplace.com";
    self.passwordTextField.text = @"12345678";
    [self textFieldTextHasChangedAction:nil];
#endif
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
}

#pragma mark -
#pragma mark - Actions

- (IBAction)signInAction:(id)sender {
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    [self.view endEditing:YES];
    
    __weak typeof (self) wSelf = self;
    [_viewModel signInWithCompletion:^(BOOL success, UIAlertController *alert) {
        [MBProgressHUD hideHUDForView:wSelf.view animated:YES];
        
        if (!success && alert) {
            [wSelf presentViewController:alert animated:YES completion:nil];
            
            return ;
        }
        
        [wSelf performSegueWithIdentifier:CSSignInAfterLoginSegueID sender:nil];
    }];
}

- (IBAction)textFieldTextHasChangedAction:(id)sender {
    self.viewModel.password = self.passwordTextField.text;
    self.viewModel.email = self.emailTextField.text;
}

- (IBAction)tapOnViewAction:(id)sender {
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
    
    self.titleLabelTopLayoutGuideVerticalSpaceConstraint.constant -= (height - bottomSpace);
    [self.view layoutIfNeeded];
}

- (void)keyboardDidHide:(NSNotification*)notification {
    self.titleLabelTopLayoutGuideVerticalSpaceConstraint.constant = 40;
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}


@end
