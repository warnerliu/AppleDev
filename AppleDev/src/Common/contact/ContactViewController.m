//
//  ContactViewController.m
//  NativeStorage
//
//  Created by warner on 11/9/15.
//  Copyright © 2015 warner. All rights reserved.
//

#import "ContactViewController.h"
#import <AddressBook/AddressBook.h>
#import "ContactInfo.h"

@interface ContactViewController (){
    NSMutableArray *contactsArray;
    UIView *view;
    UIButton *button;
    UIView *secondView;
//    CALayer *grayLayer;
}


@end

@implementation ContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    contactsArray = [[NSMutableArray alloc]init];
    self.view.backgroundColor = [UIColor whiteColor];
//    [self loadPerson];
    button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    [button setTitle:@"Click" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor grayColor];
    [button addTarget:self action:@selector(transView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    view = [[UIView alloc]initWithFrame:CGRectMake(0, 150, 200, 200)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    secondView = [[UIView alloc]initWithFrame:CGRectMake(0, 100, 50, 50)];
    secondView.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:secondView];
    [self.view.layer addSublayer:_grayLayer];
}

-(void) clickAnimation{
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
//        view.backgroundColor = [UIColor greenColor];
//        view.frame = CGRectMake(0, 150, 200, 200);
        view.alpha = 0;
    } completion:^(BOOL finish){
//        view.frame = CGRectMake(0, 150, 100, 100);
        [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            view.alpha = 1;
        } completion:nil];
    }];
}

-(void) transView{
    [UIView transitionFromView:view toView:secondView duration:1 options:UIViewAnimationOptionTransitionFlipFromBottom completion:^(BOOL finished) {
        ;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)copyAddressBook:(ABAddressBookRef)addressBook{
    
    // 2. 获取所有联系人记录
    NSArray *array = (__bridge NSArray *)(ABAddressBookCopyArrayOfAllPeople(addressBook));
    for (NSInteger i = 0; i < array.count; i++) {
        // 取出一条记录
        ABRecordRef person = (__bridge ABRecordRef)(array[i]);
        // 取出个人记录中的详细信息
        NSString *firstNameLabel = (__bridge NSString *)(ABPersonCopyLocalizedPropertyName(kABPersonFirstNameProperty));
        NSString *firstName = (__bridge NSString *)(ABRecordCopyValue(person, kABPersonFirstNameProperty));
        NSString *lastNameLabel = (__bridge NSString *)(ABPersonCopyLocalizedPropertyName(kABPersonLastNameProperty));
        NSString *lastName = (__bridge NSString *)(ABRecordCopyValue(person, kABPersonLastNameProperty));
        ABMultiValueRef phone = ABRecordCopyValue(person, kABPersonPhoneProperty);
        for (NSInteger index = 0; index < ABMultiValueGetCount(phone); index ++) {
            NSString *phoneNumber = (__bridge NSString*)ABMultiValueCopyValueAtIndex(phone, index);
            ContactInfo *contactInfo = [[ContactInfo alloc]init];
            [contactInfo setPhoneNumber:phoneNumber];
            [contactInfo setPersonName:firstName];
            [contactsArray addObject:contactInfo];
            NSLog(@"%@ %@ - %@ %@ - %@", lastNameLabel, lastName, firstNameLabel, firstName,phoneNumber);
        }
    }
    CFRelease(addressBook);
}

- (void)loadPerson{
    
    ABAddressBookRef addressBookRef = ABAddressBookCreateWithOptions(NULL, NULL);
    if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusNotDetermined) {
        ABAddressBookRequestAccessWithCompletion(addressBookRef, ^(bool granted, CFErrorRef error){
            
            CFErrorRef *error1 = NULL;
            ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, error1);
            [self copyAddressBook:addressBook];
        });
    }
    else if (ABAddressBookGetAuthorizationStatus() == kABAuthorizationStatusAuthorized){
        
        CFErrorRef *error = NULL;
        ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, error);
        [self copyAddressBook:addressBook];
    }
    else {
        dispatch_async(dispatch_get_main_queue(), ^{
            // 更新界面
            NSLog(@"没有获取通讯录权限");
        });
    }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
