//
//  ViewController.m
//  whitespace
//
//  Created by 竹嶋健人 on 2014/06/06.
//  Copyright (c) 2014年 竹嶋健人. All rights reserved.
//

#import "EditViewController.h"
#import "Errand.h"
#import "DataManager.h"

@interface EditViewController () <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate>{
    NSArray *week;
    NSString *startstr;
    NSString *finishstr;
    NSInteger  now_row;
    
}

@property (weak, nonatomic) IBOutlet UITextField *categoryText;
@property (weak, nonatomic) IBOutlet UIPickerView *weekPicker;
@property (weak, nonatomic) IBOutlet UIDatePicker *startTime;
@property (weak, nonatomic) IBOutlet UIDatePicker *finishTime;

@end

@implementation EditViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    
    
    if(self.errand){
        self.title = @"編集";
    }else {
        self.title = @"追加";
        //用事が存在しないなら新規に作成
        self.errand = [NSEntityDescription insertNewObjectForEntityForName:@"Errand" inManagedObjectContext:[[DataManager shareManager] managedObjectContext]];
    }
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self.categoryText.delegate = self;
    
    [self configureView];
    
    
}

//errandにデータを持っていれば、それを表示する
-(void)configureView
{
    if(self.errand){
        self.categoryText.text = self.errand.category;
        
        for(int i = 0 ; i < 7 ; i++){
            if(self.errand.week == week[i]){
                [self.weekPicker selectRow:i inComponent:0 animated:NO];
            }
        }
        
        NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
        [fmt setDateFormat:@"HH:mm"];
        self.startTime.date = [fmt dateFromString:self.errand.starttime];
        self.finishTime.date = [fmt dateFromString:self.errand.finishtime];
    }
}


//キャンセルボタンで、新規の場合は削除し、変更の場合は元に戻す
- (IBAction)tapbackBtn:(id)sender {
    if (self.errand.isInserted) {
        [[[DataManager shareManager] managedObjectContext] deleteObject:self.errand];
    }else{
        [[[DataManager shareManager] managedObjectContext] refreshObject:self.errand mergeChanges:NO];
    }
    
    
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}

//テキストフィールドのキーボードをreturnで隠す
- (IBAction)getText:(id)sender {
}

//時間コロコロが終わったときの値を取得
//startTime
- (IBAction)changeStartTime:(id)sender {
    //時刻表示のフォーマッタをつくる
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"HH:mm"];
    
    //時刻をフォーマッタの書式で文字に変換する
    startstr = [df stringFromDate:self.startTime.date];
    
    //出力する
    NSLog(@"%@", startstr);
}


//finishTime
- (IBAction)changeFinishTime:(id)sender {
    //時刻表示のフォーマッタをつくる
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"HH:mm"];
    
    //時刻をフォーマッタの書式で文字に変換する
    finishstr = [df stringFromDate:self.finishTime.date];
    
    //出力する
    NSLog(@"%@", finishstr);
}




//曜日のpickerviewの生成
//列数を返す
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}


//行数を返す
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 7;
}

//ピッカーに表示する文字を返す
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    week = @[@"月", @"火", @"水", @"木", @"金", @"土", @"日"];
    return week[row];
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    now_row = row;
    NSLog(@"%@", week[row]);
}


//完了ボタンを押すと入力データを保存する
- (IBAction)tapEnd:(id)sender {
    self.errand.category = self.categoryText.text;
    self.errand.week = week[now_row];
    self.errand.starttime = startstr;
    self.errand.finishtime = finishstr;
    
    [[[DataManager shareManager] managedObjectContext] save:nil];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}




- (void)didReceiveMemoryWarning

{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
