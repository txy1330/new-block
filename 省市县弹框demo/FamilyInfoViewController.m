////
////  FamilyInfoViewController.m
////  XinLianFamily
////
////  Created by pc on 16/5/13.
////  Copyright © 2016年 gangHan. All rights reserved.
////
//
#import "FamilyInfoViewController.h"
#import <Foundation/Foundation.h>
#import "PopUpView.h"
//#import "LoginViewController.h"
//#import "MBProgressHUD.h"
//#import "FamilyMainViewController.h"
//#import "MMDrawerController.h"
//#import "LeftViewController.h"
//
//#import "UILabel+Boldify.h"
//#import "ZKAutoCompleteTextField.h"
//
//#import "FMDB.h"
//
//#import "JQRequestDefine.h"
//#import "CRNetWork.h"
//
//#import "JTUserInfo.h"
//
//#import "Common.h"
//#import "UIViewExt.h"
//#import <CoreLocation/CoreLocation.h>
//#define kCellIdentifier @"cellIdentifier"
//
//typedef enum
//{
//    provinceTFTag = 1110,
//    cityTFTag,
//    countyTFtag,
//    communityTFtag
//}AutoCompleteTFTag;
//
@interface FamilyInfoViewController ()
@property (weak, nonatomic) IBOutlet UIButton *County;
@property (weak, nonatomic) IBOutlet UIButton *City;
@property (weak, nonatomic) IBOutlet UIButton *Province;
@property (nonatomic,strong) NSArray *Provinces;
@property (nonatomic,strong) NSArray *Citys;
@property (nonatomic,strong) NSArray *Countys;
@property (nonatomic,strong) NSString *queryProvinceId;
@property (nonatomic,strong) NSString *queryCityId;
@property (nonatomic,strong) NSString *queryCountyId;
//<UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource,ZKAutoCompleteTextFieldDataFilterDelegate,ZKAutoCompleteTextFieldDataSourceDelegate,MBProgressHUDDelegate,CLLocationManagerDelegate>
//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *resetTop;
//@property (weak, nonatomic) IBOutlet NSLayoutConstraint *completeTop;
//
//@property (weak, nonatomic) IBOutlet UITextField *housemaster;      //户主
//@property (weak, nonatomic) IBOutlet UITextField *houseNumber;      //户号
//@property (weak, nonatomic) IBOutlet UITextField *communityAddress; //小区地址
//
//@property (weak, nonatomic) IBOutlet UITextField *detailAddress;    //详细地址
//@property (weak, nonatomic) IBOutlet UITextField *housePNum;        //家庭人口
//@property (weak, nonatomic) IBOutlet UITextField *electricity;      //用电量
//
//@property (strong, nonatomic) UIPickerView *pickView;
//@property (strong, nonatomic) UIView *pickViewBG;        //选择框
//@property (strong, nonatomic) NSArray *pNumItem;
//
//@property (strong, nonatomic) UIView * xibView;
//
//@property(nonatomic,strong)FMDatabase *db;
//
//@property (copy , nonatomic)NSString *queryCityID;      //查询所有市的ID
//@property (copy , nonatomic)NSString *queryCountyID;      //查询所有县的ID
//@property (copy , nonatomic)NSString *areaDistrictID;       //最终地区ID
//@property (copy , nonatomic)NSString *queryCommunityID;       //最终小区ID
//
//
//
//@property (nonatomic,strong)CLLocationManager *locationManager;
//@property (nonatomic,strong)UIActivityIndicatorView *activityView;
//
@end
//
@implementation FamilyInfoViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}
- (void)viewDidLoad
{

}
- (NSArray *)Provinces
{
    if (!_Provinces) {
        _Provinces = @[@"安徽",@"江苏",@"湖南",@"湖北",@"浙江",@"四川",@"河南",@"河北",@"北京",@"上海"];
    }
    return _Provinces;
}
- (NSArray *)Citys
{
    if (!_Citys) {
        _Citys = @[@"安徽1",@"江苏1",@"湖南1",@"湖北1",@"浙江1",@"四川1",@"河南1",@"河北1",@"北京1",@"上海1"];
    }
    return _Citys;
}
- (NSArray *)Countys
{
    if (!_Countys) {
        _Countys = @[@"安徽2",@"江苏2",@"湖南2",@"湖北2",@"浙江2",@"四川2",@"河南2",@"河北2",@"北京2",@"上海2"];
    }
    return _Countys;
}
- (IBAction)choseProvince:(UIButton *)sender {
    CGPoint startPoint = CGPointMake(sender.frame.origin.x,sender.frame.origin.y+sender.frame.size.height);
    
   [PopUpView PopUpViewWithListArray:_Provinces AndStartPoint:startPoint andWidth:150 andOperate:^(NSUInteger index) {
       [_Province setTitle:_Provinces[index] forState:UIControlStateNormal];
       _queryProvinceId = [NSString stringWithFormat:@"%ld",index];
       NSLog(@"_queryProvinceId : %@",_queryProvinceId);
   }];
    
}
- (IBAction)choseCity:(id)sender {
    
}
- (IBAction)choseCounty:(id)sender {
}

//    ZKAutoCompleteTextField *autoProvinceTF;
//    NSArray *provinceDataSource;
//    NSMutableArray *newProvinceDataSource;
//    NSDictionary *provinceDic;
//    
//    ZKAutoCompleteTextField *autoCityTF;
//    NSArray *cityDataSource;
//    NSMutableArray *newCityDataSource;
//    NSDictionary *cityDic;
//    
//    ZKAutoCompleteTextField *autoCountyTF;
//    NSArray *countyDataSource;
//    NSMutableArray *newCountyDataSource;
//    NSDictionary *countyDic;
//    
//    
//    ZKAutoCompleteTextField *autoCommunityTF;
//    NSArray *CommunityDataSource;
//    NSMutableArray *newCommunityDataSource;
//    NSDictionary *CommunityDic;
//    
//    NSTimer *timer;
//    
//    
//    CLGeocoder *_geocoder;
//    
//}
//- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
//    
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        
//        self.hidesBottomBarWhenPushed = YES;
//    }
//    return self;
//}
//-(void)viewWillAppear:(BOOL)animated{
//    //NSLog(@"_province:%@\nxibView:%@",_province,self.xibView);
//    
//    _locationManager = [[CLLocationManager alloc] init];
//    //请求用户,获得定位的权限
//    [_locationManager requestWhenInUseAuthorization];
//    //设置精确度
//    _locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
//    _locationManager.delegate = self;
//    //定位
//    [_locationManager startUpdatingLocation];
//    
//    
//    //显示加载提示
//    if (_activityView == nil)
//    {
//        _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//        _activityView.frame = CGRectMake(10, 0,15, 15);
//    }
//    [_activityView startAnimating];
//    
//}
//
//- (void)viewWillDisappear:(BOOL)animated{
//    [super viewWillDisappear:animated];
//    [timer invalidate];
//    
//}
//-(void)getFamilyInfo
//{
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [CRNetWork requestWithAction:FamilyInfoAction parameters:@{} success:^(id obj) {
//            
//            NSLog(@"获取家庭数据");
//            //户主名
//            self.housemaster.text = obj[@"result"][@"residents"][@"name"];
//            //省
//            autoProvinceTF.suggestTextField.text =obj[@"result"][@"residents"][@"province"];
//            
//            //市
//            autoCityTF.suggestTextField.text = obj[@"result"][@"residents"][@"city"];;
//            
//            //区
//            autoCountyTF.suggestTextField.text =obj[@"result"][@"residents"][@"area"];;
//            autoCommunityTF.suggestTextField.text = obj[@"result"][@"residents"][@"pname"];;//小区地址
//            self.detailAddress.text = obj[@"result"][@"residents"][@"addr"];;//详细地址
//            self.housePNum.text = obj[@"result"][@"residents"][@"people"];;//家庭人数
//            self.electricity.text =obj[@"result"][@"residents"][@"avgElect"];//人均用电量
//            
//            self.houseNumber.text = obj[@"result"][@"residents"][@"cn"];//户号
//
//        } failure:^(id obj) {
//            NSLog(@"%@",obj);
//            [self showAlertMessage:@"数据加载失败" successMsg:NO];
//        }];
//    });
//}
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    if (self.navTitle.length != 0) {
//        self.title = self.navTitle;
//    }else{
//        self.title = @"修改家庭信息";
//
//    }
//    self.pNumItem = @[@"1人",@"2人",@"3人",@"4人",@"5人",@"6人"];
//    
//    self.xibView = [[NSBundle mainBundle] loadNibNamed:@"FamilyInfoViewController" owner:self options:Nil][0];
//    
//    _housemaster.delegate = self;
//    _detailAddress.delegate = self;
//    _housePNum.delegate = self;
//    _electricity.delegate = self;
//    
//    _communityAddress.hidden = YES;
//    _communityAddress.delegate = self;
//    
//    _electricity.delegate = self;
//    if (IPHONE4) {
//        self.resetTop.constant = 5;
//        self.completeTop.constant = 5;
//    }
//    
//    [self openDB];
//    
//    //[self initPickView];
//    
//    [self initAutoCompletTF];
//    
//
//    [self getFamilyInfo];
//    
//    
//    //[self getLocalData];
//    
//}
//-(void)getLocalData{
//    JTUserInfo *user =[JTUserInfo userInfo];
//    self.housemaster.text = user.housemaster;
//    
//    //省
//    autoProvinceTF.suggestTextField.text = user.province;
//
//    //市
//    autoCityTF.suggestTextField.text = user.city;
//
//    //区
//    autoCountyTF.suggestTextField.text = user.county;
//    
// 
//    autoCommunityTF.suggestTextField.text = user.communityAdr;
//    self.detailAddress.text = user.detailAdr;
//    self.housePNum.text = [user.peopleNum stringByAppendingString:@""];
//    float eleNum = [user.electNum floatValue];
//    self.electricity.text = [NSString stringWithFormat:@"%.2f" , eleNum];
//    
//    self.houseNumber.text = user.houseNumber;
//    
//}
//
//
//- (void)awakeFromNib
//{
//    //后续调整代码
//    
//    
//}
//
//#pragma - mark 创建UIPickView
//-(void)initPickView{
//    
//    self.pickViewBG = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight-220, kScreenWidth, 220)];
//    self.pickViewBG.backgroundColor = [UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1.0];
//    self.pickViewBG.hidden = YES;
//    
//    UIView *lineT = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 0.5)];
//    lineT.backgroundColor = [UIColor colorWithRed:205/255.0 green:205/255.0 blue:205/255.0 alpha:1.0];
//    [self.pickViewBG addSubview:lineT];
//    
//    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(kScreenWidth-50, 0.5, 40, 29)];
//    [button setTitle:@"完成" forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(hidenPickView) forControlEvents:UIControlEventTouchUpInside];
//    [self.pickViewBG addSubview:button];
//    
//    UIView *lineB = [[UIView alloc]initWithFrame:CGRectMake(0, 29.5, kScreenWidth, 0.5)];
//    lineB.backgroundColor = [UIColor colorWithRed:205/255.0 green:205/255.0 blue:205/255.0 alpha:1.0];
//    [self.pickViewBG addSubview:lineB];
//    
//    self.pickView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 30, kScreenWidth, 190)];
//    self.pickView.dataSource = self;
//    self.pickView.delegate = self;
//    [self.pickViewBG addSubview:self.pickView];
//    
//    [self.view addSubview:self.pickViewBG];
//    
//}
//-(void)hidenPickView{
//    self.pickViewBG.hidden = YES;
//}
//
//#pragma mark -UIPickerViewDataSource
//
//// UIPickerViewDataSource中定义的方法，设置出现几个下拉列表 （返回2 表示出现2个下拉列表）
//- (NSInteger)numberOfComponentsInPickerView:(UIPickerView*)pickerView
//{
//        return 1;
//}
//// UIPickerViewDataSource中定义的方法，该方法返回值决定该控件指定列包含多少个列表项
//- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
//{
//        return _pNumItem.count;
//}
//
//// 当用户选中UIPickerViewDataSource中指定列、指定列表项时激发该方法
//- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
//{
//        self.housePNum.text = _pNumItem[row];
//}
//
//#pragma mark -UIPickerViewDelegate
//// UIPickerViewDelegate中定义的方法，该方法返回的NSString将作为UIPickerView
//- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
//{
//         return [_pNumItem objectAtIndex:row];
//}
//
//
//
//#pragma - mark 创建下拉
//-(void)initAutoCompletTF{
//    timer = [NSTimer timerWithTimeInterval:0.1 target:self selector:@selector(refreshDataSource) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSDefaultRunLoopMode];
//    
//    provinceDic = [self getAllProvinceDic];
//    provinceDataSource = [NSArray array];
//    provinceDataSource = provinceDic.allKeys;
//    newProvinceDataSource = [NSMutableArray arrayWithArray:provinceDataSource];
//    
//    CGFloat itemWidth = (kScreenWidth-121)/3;
//    
//    autoProvinceTF = [[ZKAutoCompleteTextField alloc]initWithFrame:CGRectMake(101, 193, itemWidth, 30)];
//    autoProvinceTF.suggestTextField.placeholder = @"省";
//    autoProvinceTF.tag = provinceTFTag;
//    [autoProvinceTF setDropDownDirection:ZKDropDownDirectionDown];
//    [autoProvinceTF setDataFilterDelegate:self];
//    [autoProvinceTF setDataSourceDelegate:self];
//    
//    [self.xibView addSubview:autoProvinceTF];
//    
//    
//    autoCityTF = [[ZKAutoCompleteTextField alloc]initWithFrame:CGRectMake(101+itemWidth+1, 193, itemWidth, 30)];
//    autoCityTF.suggestTextField.placeholder = @"市";
//    autoCityTF.tag = cityTFTag;
//    [autoCityTF setDropDownDirection:ZKDropDownDirectionDown];
//    [autoCityTF setDataFilterDelegate:self];
//    [autoCityTF setDataSourceDelegate:self];
//    
//    [self.xibView addSubview:autoCityTF];
//
//    
//    autoCountyTF = [[ZKAutoCompleteTextField alloc]initWithFrame:CGRectMake(101+2*itemWidth+2, 193, (kScreenWidth-121)/3, 30)];
//    autoCountyTF.suggestTextField.placeholder = @"县";
//    autoCountyTF.tag = countyTFtag;
//    [autoCountyTF setDropDownDirection:ZKDropDownDirectionDown];
//    [autoCountyTF setDataFilterDelegate:self];
//    [autoCountyTF setDataSourceDelegate:self];
//    
//    [self.xibView addSubview:autoCountyTF];
//    
//    
//    autoCommunityTF = [[ZKAutoCompleteTextField alloc]initWithFrame:CGRectMake(101, 242, kScreenWidth-121, 30)];
//    autoCommunityTF.suggestTextField.placeholder = @"请选择小区地址";
//    autoCommunityTF.tag = communityTFtag;
//    [autoCommunityTF setDropDownDirection:ZKDropDownDirectionDown];
//    [autoCommunityTF setDataFilterDelegate:self];
//    [autoCommunityTF setDataSourceDelegate:self];
//    
//    [self.xibView addSubview:autoCommunityTF];
//
//    
//}
//
//
//
//
//- (void)refreshDataSource{
//    
//    if (autoProvinceTF.suggestTextField.isEditing) {
//        if (IPHONE5) {
//            self.view.frame = CGRectMake(0, -60, kScreenWidth, kScreenHeight+60);
//        }
//        newProvinceDataSource = [NSMutableArray arrayWithArray:provinceDataSource];
//        [self autoCompleteTextBox:autoProvinceTF didFilterSourceUsingString:autoProvinceTF.suggestTextField.text];
//        [autoProvinceTF.suggestListView reloadData];
//        
//    }else if (autoCityTF.suggestTextField.isEditing) {
//        countyDataSource = @[];
//        [autoCountyTF.suggestListView reloadData];
//        if (IPHONE5) {
//            self.view.frame = CGRectMake(0, -60, kScreenWidth, kScreenHeight+60);
//        }
//        newCityDataSource = [NSMutableArray arrayWithArray:cityDataSource];
//        [self autoCompleteTextBox:autoCityTF didFilterSourceUsingString:autoCityTF.suggestTextField.text];
//        [autoCityTF.suggestListView reloadData];
//    
//    }else if (autoCountyTF.suggestTextField.isEditing) {
//        
//        if (IPHONE5) {
//            self.view.frame = CGRectMake(0, -60, kScreenWidth, kScreenHeight+60);
//        }
//        newCountyDataSource = [NSMutableArray arrayWithArray:countyDataSource];
//        [self autoCompleteTextBox:autoCountyTF didFilterSourceUsingString:autoCountyTF.suggestTextField.text];
//        [autoCountyTF.suggestListView reloadData];
//    }else if (autoCommunityTF.suggestTextField.isEditing) {
//        self.view.frame = CGRectMake(0, -80, kScreenWidth, kScreenHeight+80);
//        newCommunityDataSource = [NSMutableArray arrayWithArray:CommunityDataSource];
//        [self autoCompleteTextBox:autoCommunityTF didFilterSourceUsingString:autoCommunityTF.suggestTextField.text];
//        [autoCommunityTF.suggestListView reloadData];
//    }
//    
//    
//    
//    if (autoProvinceTF.suggestTextField.isEditing == NO && autoProvinceTF.suggestTextField.text.length != 0) {
//        
////        if (_queryCityID != [provinceDic valueForKey:autoProvinceTF.suggestTextField.text]) {
//
//            _queryCityID = [provinceDic valueForKey:autoProvinceTF.suggestTextField.text];
//            NSLog(@"queryCityID-------->%@",_queryCityID);
//            
//            if (_queryCityID.length != 0) {
//                cityDic = [self getCityDicWithProvinceID:_queryCityID];
//                cityDataSource = [NSArray array];
//                cityDataSource = cityDic.allKeys;
//                newCityDataSource = [NSMutableArray arrayWithArray:cityDataSource];
//            }
//
//            
////        }
//        
//    }
//    else if([autoProvinceTF.suggestTextField.text isEqualToString:@""]){
//        autoCityTF.suggestTextField.text = @"";
//        autoCountyTF.suggestTextField.text = @"";
//        _areaDistrictID = @"";
//        cityDataSource = @[];
//        countyDataSource = @[];
//    }else
//    {
//        autoCityTF.suggestTextField.text = @"";
//        autoCountyTF.suggestTextField.text = @"";
//        _areaDistrictID = @"";
////        cityDataSource = @[];
//        countyDataSource = @[];
//    }
//    
//    
//    
//    if (autoCityTF.suggestTextField.isEditing == NO && autoCityTF.suggestTextField.text.length != 0) {
//        
////        if (_queryCountyID != [cityDic valueForKey:autoCityTF.suggestTextField.text]) {
//
//            _queryCountyID = [cityDic valueForKey:autoCityTF.suggestTextField.text];
//            NSLog(@"queryCountyID-------->%@",_queryCountyID);
//            
//            if (_queryCountyID.length != 0) {
//                countyDic = [self getCountyDicWithCityID:_queryCountyID];
//                countyDataSource = [NSArray array];
//                countyDataSource = countyDic.allKeys;
//                newCountyDataSource = [NSMutableArray arrayWithArray:countyDataSource];
//            }
//            
////        }
//        
//    }else if(autoCityTF.suggestTextField.text.length == 0){
//        autoCountyTF.suggestTextField.text = @"";
//        autoCityTF.suggestTextField.text = @"";
//        countyDataSource = @[];
//        _areaDistrictID = @"";
//    }else
//    {
//        autoCountyTF.suggestTextField.text = @"";
//        autoCityTF.suggestTextField.text = @"";
////        countyDataSource = @[];
//        _areaDistrictID = @"";
//    }
//    
//     if (autoCountyTF.suggestTextField.isEditing == NO && autoCountyTF.suggestTextField.text.length != 0) {
//         
//         if (_areaDistrictID != [countyDic valueForKey:autoCountyTF.suggestTextField.text]) {
//             _areaDistrictID = [countyDic valueForKey:autoCountyTF.suggestTextField.text];
//             NSLog(@"最终地区码------>%@",_areaDistrictID);
//             
//             
//            [self getCommunityList:_areaDistrictID];
//         }
//     }else{
//         _areaDistrictID = @"";
//     }
//    
//    
//    if ((autoCommunityTF.suggestTextField.isEditing == NO)
//        && (autoCountyTF.suggestTextField.isEditing == NO)
//        && (autoCityTF.suggestTextField.isEditing == NO)
//        && (autoProvinceTF.suggestTextField.isEditing == NO)){
//         self.view.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
//    }
//
//    
//    if (autoCommunityTF.suggestTextField.isEditing == NO && autoCommunityTF.suggestTextField.text.length != 0) {
//
//        if (_queryCommunityID != [CommunityDic valueForKey:autoCommunityTF.suggestTextField.text]) {
//            _queryCommunityID = [CommunityDic valueForKey:autoCommunityTF.suggestTextField.text];
//            NSLog(@"最终小区ID------>%@",_queryCommunityID);
//            
//        }
//    }else{
//        _queryCommunityID = @"";
//    }
//    
//    
//    
//    
//}
//
//
//
//- (NSInteger)autoCompleteTextBox:(ZKAutoCompleteTextField *)autoCompleteTextBox numberOfRowsInSection:(NSInteger)section{
//    if (autoCompleteTextBox.tag == countyTFtag) {
//        return newCountyDataSource.count;
//    }else if (autoCompleteTextBox.tag == cityTFTag){
//        return newCityDataSource.count;
//    }else if (autoCompleteTextBox.tag == provinceTFTag){
//        return newProvinceDataSource.count;
//    }else{
//        return newCommunityDataSource.count;
//    }
//
//}
//
//
//- (UITableViewCell *)autoCompleteTextBox:(ZKAutoCompleteTextField *)autoCompleteTextBox cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    UITableViewCell *cell = [autoCompleteTextBox.suggestListView dequeueReusableCellWithIdentifier:kCellIdentifier];
//    
//    // Create cell, you can use the most recent way to create a cell.
//    if(!cell)
//    {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kCellIdentifier];
//        [cell.textLabel setFont:[UIFont fontWithName:cell.textLabel.font.fontName size:15]];
//        cell.textLabel.adjustsFontSizeToFitWidth = YES;
//        [cell.textLabel setTextColor:[UIColor blackColor]];
//        [cell setBackgroundColor:[UIColor colorWithRed:205/255.0 green:205/255.0 blue:205/255.0 alpha:1.0]];
//    }
//    
//    
//    if (autoCompleteTextBox.tag == countyTFtag) {
//        [cell.textLabel setText:newCountyDataSource[indexPath.row]];
//        
//        
//    }else if (autoCompleteTextBox.tag == cityTFTag){
//        [cell.textLabel setText:newCityDataSource[indexPath.row]];
//      
//
//    }else if (autoCompleteTextBox.tag == provinceTFTag){
//        [cell.textLabel setText:newProvinceDataSource[indexPath.row]];
//    
//    }else{
//         [cell.textLabel setText:newCommunityDataSource[indexPath.row]];
//    }
//
//    [cell.textLabel normalizeSubstring:cell.textLabel.text];
//
//    // Highlight the selection
//    if(autoCompleteTextBox.filterString)
//    {
//        [cell.textLabel boldSubstring:autoCompleteTextBox.filterString];
//        
//    }
//    
//    return cell;
//    
//}
//
//
//-(BOOL)shouldFilterDataSource:(ZKAutoCompleteTextField *)autoCompleteTextBox
//{
//    return YES;
//}
//
//
//-(void)autoCompleteTextBox:(ZKAutoCompleteTextField *)autoCompleteTextBox didFilterSourceUsingString:(NSString *)string
//{
//    if ([string length] == 0)
//    {
//        if (autoCompleteTextBox.tag == countyTFtag) {
//            newCountyDataSource = [NSMutableArray arrayWithArray:countyDataSource];
//        }else if (autoCompleteTextBox.tag == cityTFTag){
//            newCityDataSource = [NSMutableArray arrayWithArray:cityDataSource];
//        }else if (autoCompleteTextBox.tag == provinceTFTag){
//            newProvinceDataSource = [NSMutableArray arrayWithArray:provinceDataSource];
//        }else{
//            newCommunityDataSource = [NSMutableArray arrayWithArray:CommunityDataSource];
//        }
//        return;
//    }
//    
//    
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF contains [cd] %@", string];
//    if (autoCompleteTextBox.tag == countyTFtag) {
//        NSArray *filterdArray = [countyDataSource filteredArrayUsingPredicate:predicate];
//        newCountyDataSource =(NSMutableArray *) filterdArray;
//    }else if (autoCompleteTextBox.tag == cityTFTag){
//        NSArray *filterdArray = [cityDataSource filteredArrayUsingPredicate:predicate];
//        newCityDataSource =(NSMutableArray *) filterdArray;
//    }else if (autoCompleteTextBox.tag == provinceTFTag){
//        NSArray *filterdArray = [provinceDataSource filteredArrayUsingPredicate:predicate];
//        newProvinceDataSource =(NSMutableArray *) filterdArray;
//    }else{
//        NSArray *filterdArray = [CommunityDataSource filteredArrayUsingPredicate:predicate];
//        newCommunityDataSource =(NSMutableArray *) filterdArray;
//    }
//
//    
//    
//}
//
//
//
//#pragma - mark 打开数据库
//-(void)openDB{
//    NSString * docPath = [[NSBundle mainBundle] pathForResource:@"areaList" ofType:@"db"];
//    self.db = [FMDatabase databaseWithPath:docPath] ;
//    [self.db open];
//}
//
//#pragma - mark 得到所有省份
//-(NSDictionary *)getAllProvinceDic{
//    NSMutableDictionary *provinceMDic = [NSMutableDictionary dictionary];
//    FMResultSet *resultSet = [self.db executeQuery:@"SELECT * FROM district where LevelNum is 1"];
//    while ([resultSet next]) {
//        NSString * ID = [resultSet stringForColumn:@"DistrictId"];
//        NSString *name = [resultSet stringForColumn:@"Name"];
//        NSString *age = [resultSet stringForColumn:@"LevelNum"];
//        NSLog(@"%@ %@ %@", ID, name, age);
//        [provinceMDic setObject:ID forKey:name];
//    }
//    return provinceMDic;
//}
//
//#pragma - mark 得到所选省份对应所有的市
//-(NSDictionary *)getCityDicWithProvinceID: (NSString *)ProvinceID{
//    NSString *queryId = [ProvinceID substringToIndex:2];
//    
//    NSMutableDictionary *cityMDic = [NSMutableDictionary dictionary];
//    NSString *queryStr = [NSString stringWithFormat:@"SELECT * FROM district where DistrictId like '%@%%' and LevelNum is 2",queryId];
//    
//    FMResultSet *resultSet = [self.db executeQuery:queryStr];
//    while ([resultSet next]) {
//        NSString * ID = [resultSet stringForColumn:@"DistrictId"];
//        NSString *name = [resultSet stringForColumn:@"Name"];
//        NSString *age = [resultSet stringForColumn:@"LevelNum"];
//        NSLog(@"%@ %@ %@", ID, name, age);
//        [cityMDic setObject:ID forKey:name];
//    }
//    return cityMDic;
//}
//
//#pragma - mark 得到所选市对应所有的县
//-(NSDictionary *)getCountyDicWithCityID: (NSString *)CityID{
//    NSString *queryId = [CityID substringToIndex:4];
//    NSLog(@"----->查询市id：%@",queryId);
//    
//    NSMutableDictionary *countyMDic = [NSMutableDictionary dictionary];
//    NSString *queryStr = [NSString stringWithFormat:@"SELECT * FROM district where DistrictId like '%@%%' and LevelNum in (3,4)",queryId];
//    
//    FMResultSet *resultSet = [self.db executeQuery:queryStr];
//    while ([resultSet next]) {
//        NSString * ID = [resultSet stringForColumn:@"DistrictId"];
//        NSString *name = [resultSet stringForColumn:@"Name"];
//        NSString *age = [resultSet stringForColumn:@"LevelNum"];
//        NSLog(@"%@ %@ %@", ID, name, age);
//        [countyMDic setObject:ID forKey:name];
//    }
//    return countyMDic;
//}
//
//
//#pragma  - mark 得到小区列表
//-(void)getCommunityList:(NSString *)areaCode {
//    
//    NSMutableDictionary *cDic = [NSMutableDictionary dictionary];
//    [CRNetWork requestWithAction:@"FmUserInfoSerivce|GetQuatersInfo" parameters:@{@"area":@"320000"} success:^(id obj) {
//        NSLog(@"小区列表T------>%@",obj);
//        
//        if ([obj[@"state"] integerValue] == 1) {
//            for (NSDictionary *dic in obj[@"result"]) {
//                NSString * name = dic[@"name"];
//                NSString *py = dic[@"py"];
//                NSString *uid = dic[@"uid"];
//                NSLog(@"---->小区%@ %@ %@", name, py, uid);
//                [cDic setObject:uid forKey:name];
//            }
//            
//            
//            CommunityDic = cDic;
//            CommunityDataSource = [NSArray array];
//            CommunityDataSource = CommunityDic.allKeys;
//            newCommunityDataSource = [NSMutableArray arrayWithArray:CommunityDataSource];
//            
//        }
//        
//        
//        
//    } failure:^(id obj) {
//        NSLog(@"小区列表F------>%@",obj);
//    }];
//    
//    
//    
//}
//
//
//#pragma - mark 完成按钮
//- (IBAction)complete:(UIButton *)sender {
//    if (!self.housemaster.text || [@"" isEqualToString:self.housemaster.text]) {
//        [self showAlertMessage:@"请输入户主名" successMsg:NO];
//        return;
//    }
//    
//    if (!self.houseNumber.text || [@"" isEqualToString:self.houseNumber.text]) {
//        [self showAlertMessage:@"请输入户号" successMsg:NO];
//        return;
//    }
//    
//    if (self.houseNumber.text.length != 10) {
//        [self showAlertMessage:@"请输入10位户号" successMsg:NO];
//        return;
//    }
//    
//    if (!autoProvinceTF.suggestTextField.text || [@"" isEqualToString:autoProvinceTF.suggestTextField.text]) {
//        [self showAlertMessage:@"请输入省份" successMsg:NO];
//        return;
//    }
//    
//    if (!autoCityTF.suggestTextField.text || [@"" isEqualToString:autoCityTF.suggestTextField.text]) {
//        [self showAlertMessage:@"请输入市" successMsg:NO];
//        return;
//    }
//    
//    if (!autoCountyTF.suggestTextField.text || [@"" isEqualToString:autoCountyTF.suggestTextField.text]) {
//        [self showAlertMessage:@"请输入县" successMsg:NO];
//        return;
//    }
//    
//    if (!autoCommunityTF.suggestTextField.text || [@"" isEqualToString:autoCommunityTF.suggestTextField.text]) {
//        [self showAlertMessage:@"请选择小区地址" successMsg:NO];
//        return;
//    }
//    
//    if (!self.detailAddress.text || [@"" isEqualToString:self.detailAddress.text]) {
//        [self showAlertMessage:@"请填写详细地址" successMsg:NO];
//        return;
//    }
//    //小区详细地址不能超过50位
//    NSString* detailAddressValue=self.detailAddress.text;
//    if([detailAddressValue length]>50)
//    {
//        [self showAlertMessage:@"详细地址不能超过50位" successMsg:NO];
//        return;
//    }
//    if (!self.housePNum.text || [@"" isEqualToString:self.housePNum.text]) {
//        [self showAlertMessage:@"请选择家庭人口" successMsg:NO];
//        return;
//    }
//    //家庭人口不能超过20位
//    NSString* familyPeople=self.housePNum.text;
//    if([familyPeople integerValue]>20)
//    {
//        [self showAlertMessage:@"家庭人口数范围1-20人" successMsg:NO];
//        return;
//    }
//    if (!self.electricity.text || [@"" isEqualToString:self.electricity.text]) {
//        [self showAlertMessage:@"请填写上月用电量" successMsg:NO];
//        return;
//    }
//    //上月电量值超过1万容错
//    NSString* electricityValue=self.electricity.text;
//    if([electricityValue integerValue]>10000)
//    {
//        [self showAlertMessage:@"上月电量不能超过10000" successMsg:NO];
//        return;
//    }
//    if (!_areaDistrictID || [@"" isEqualToString:_areaDistrictID]) {
//        [self showAlertMessage:@"请选择家庭住址" successMsg:NO];
//        return;
//    }
//    BOOL YON = NO;
//    for (NSString *Str in newCommunityDataSource) {
//        if ([autoCommunityTF.suggestTextField.text isEqualToString:Str]) {
//            YON = YES;
//        }
//    }
//    if (!YON) {
//        [self showAlertMessage:@"请选择正确的小区信息" successMsg:NO];
//        return;
//    }
//    
//    NSDictionary *parameter = @{
//                                @"name":self.housemaster.text,
//                                @"addr":self.detailAddress.text,
//                                @"puid": self.queryCommunityID,
//                                @"cn":self.houseNumber.text,
//                                @"iuid":@"",
//                                @"isd":@"0",
//                                @"proname":autoProvinceTF.suggestTextField.text,
//                                @"cityname":autoCityTF.suggestTextField.text,
//                                @"quname":autoCountyTF.suggestTextField.text,
//                                @"pernum":self.housePNum.text,
//                                @"elecnum":self.electricity.text
//                                };
//    [self showSimpleLoadingView];
//    
//    NSString *urlStr;
//    if([self.title  isEqual: @"修改家庭信息"]){
//        urlStr = UpdUserInf;
//    }else{
//        urlStr = ImpUserInf;
//    }
//    
//    [CRNetWork requestWithAction:urlStr parameters:parameter success:^(id obj) {
//        NSLog(@"----->%@",obj);
//        
//        
//        if ([obj[@"state"] integerValue] == 1) {
//            [self hiddenSimpleLoadingView];
//            
//            
//            JTUserInfo *jq = [JTUserInfo userInfo];
//            jq.province = autoProvinceTF.suggestTextField.text;
//            jq.city = autoCityTF.suggestTextField.text;
//            jq.county = autoCountyTF.suggestTextField.text;
//            jq.housemaster = self.housemaster.text;
//            jq.houseNumber = self.houseNumber.text;
//            jq.communityAdr = autoCommunityTF.suggestTextField.text;
//            jq.detailAdr = self.detailAddress.text;
//            jq.peopleNum = self.housePNum.text;
//            jq.electNum = self.electricity.text;
//            
//            if([self.title  isEqual: @"修改家庭信息"]){
//               
//                
//            }else{
//                            
//                if (obj[@"result"][@"arr"][0]) {
//                    
//                    jq.uid = obj[@"result"][@"arr"][0][@"uid"];
//                }
//            }
////            jq.userName = jq.userName;
////            jq.token = jq.token;
////            jq.isd = jq.isd;
////            jq.phnum = jq.phnum;
//            
//            [jq saveUserInfo];
//            
//            [self showAlertMessage:@"完善资料成功" successMsg:YES];
//            
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                [self.navigationController popViewControllerAnimated:YES];
//            });
//            
//            
//            
////            [self dismissViewControllerAnimated:YES completion:^{
//            
////                UIWindow * window = [UIApplication sharedApplication].delegate.window;
////                //创建左侧控制器
////                LeftViewController *left = [[LeftViewController alloc] init];
////                //创建中间的控制器
////                MainViewController *center = [[MainViewController alloc] init];
////                
////                MMDrawerController *drawerCtrl = [[MMDrawerController alloc] initWithCenterViewController:center leftDrawerViewController:left];
////                
////                [drawerCtrl setShowsShadow:YES];
////                [drawerCtrl setMaximumLeftDrawerWidth:kScreenWidth - 100];
////                [drawerCtrl setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
////                [drawerCtrl setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
////                
////                //设置窗口的根控制器
////                window.rootViewController = drawerCtrl;
////            }];
//        }
//        
//
//        
//        
//    } failure:^(id obj) {
//        
//        [self hiddenSimpleLoadingView];
//        [self showAlertMessage:obj successMsg:NO];
//    }];
//    
//    
//
//}
//
//#pragma - mark 重置按钮
//- (IBAction)resetAll:(UIButton *)sender {
////    self.housemaster.text = @"";
////    autoProvinceTF.suggestTextField.text = @"";
////    autoCityTF.suggestTextField.text = @"";
////    autoCountyTF.suggestTextField.text = @"";
////    autoCommunityTF.suggestTextField.text = @"";
////    self.detailAddress.text = @"";
////    self.housePNum.text = @"";
////    self.electricity.text = @"";
//}
//#pragma - mark 暂不完善，跳过
//- (IBAction)skip:(id)sender {
//
//    [self dismissViewControllerAnimated:NO completion:^{
//        
//        UIWindow * window = [UIApplication sharedApplication].delegate.window;
//        //创建左侧控制器
//        LeftViewController *left = [[LeftViewController alloc] init];
//        //创建中间的控制器
//        FamilyMainViewController *center = [[FamilyMainViewController alloc] init];
//        
//        MMDrawerController *drawerCtrl = [[MMDrawerController alloc] initWithCenterViewController:center leftDrawerViewController:left];
//        
//        [drawerCtrl setShowsShadow:YES];
//        [drawerCtrl setMaximumLeftDrawerWidth:kScreenWidth - 100];
//        [drawerCtrl setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeNone];
//        [drawerCtrl setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
//        
//        //设置窗口的根控制器
//        window.rootViewController = drawerCtrl;
//    }];
//}
//
//
//#pragma - mark UITextFieldDelegate
//-(void)textFieldDidBeginEditing:(UITextField *)textField{
//    
////    if (textField == self.housePNum ) {
////
//////        [self.housemaster resignFirstResponder];
//////        [self.communityAddress resignFirstResponder];
//////        [self.detailAddress resignFirstResponder];
//////        [self.housePNum resignFirstResponder];
//////        [self.electricity resignFirstResponder];
////        
//////        [textField resignFirstResponder];
////        self.pickViewBG.hidden = NO;   //人数
////        [self.view endEditing:YES];
////        
////    }else{
////        self.pickViewBG.hidden = YES;
////        
////
////    }
//    
//   
//}
//
//
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//            [self.housemaster resignFirstResponder];
//            [self.communityAddress resignFirstResponder];
//            [self.detailAddress resignFirstResponder];
//            [self.housePNum resignFirstResponder];
//            [self.electricity resignFirstResponder];
//}
//
//
//-(void)textFieldDidEndEditing:(UITextField *)textField{
//    [textField resignFirstResponder];
//}
//
//
//- (void)showAlertMessage:(NSString *)message successMsg:(BOOL)isSuccess
//{
//    MBProgressHUD *hub = [[MBProgressHUD alloc] initWithView:self.view];
//    [self.view addSubview:hub];
//    hub.labelText = message;
//    hub.delegate = self;
//    hub.mode = MBProgressHUDModeCustomView;
//    if (isSuccess) {
//        hub.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"success"]];
//    }else
//    {
//        hub.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"error"]];
//    }
//    
//    [hub show:YES];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
//    });
//    
//    
//}
//
//- (void)showSimpleLoadingView
//{
//    MBProgressHUD *hub = [[MBProgressHUD alloc] initWithView:self.view];
//    [self.view addSubview:hub];
//    hub.delegate = self;
//    [hub show:YES];
//}
//
//
//- (void)hiddenSimpleLoadingView
//{
//    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
//}
//
//#pragma mark -CLLocationManagerDelegate
//- (void)locationManager:(CLLocationManager *)manager
//     didUpdateLocations:(NSArray *)locations
//{
//    
//    //定位成功后,调用的协议方法
//    //停止定位
//    [manager stopUpdatingLocation];
//    
//    //创建位置编码对象
//    _geocoder = [[CLGeocoder alloc] init];
//    
//    [_geocoder reverseGeocodeLocation:[locations lastObject] completionHandler:^(NSArray *placemarks, NSError *error) {
//        
//        CLPlacemark *mark = [placemarks lastObject];
//        //获取位置信息
//        //_locationName.text = mark.locality;
//        NSLog(@"位置信息-------->省：%@-----市：%@-----区：%@",mark.administrativeArea,mark.locality,mark.subLocality);
//        
//        if (autoProvinceTF.suggestTextField.text.length == 0) {
//            autoProvinceTF.suggestTextField.text = mark.administrativeArea;
//        }
//        if (autoCityTF.suggestTextField.text.length == 0) {
//            autoCityTF.suggestTextField.text = mark.locality;
//        }
//        if (autoCountyTF.suggestTextField.text.length == 0) {
//            autoCountyTF.suggestTextField.text = mark.subLocality;
//        }
//        
//        
//        
//        
//        
//    }];
//}
//#pragma - mark didReceiveMemoryWarning
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
///*
//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}
//*/
//
@end
