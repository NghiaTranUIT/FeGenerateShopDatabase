//
//  FeData.m
//  GenerateJSON
//
//  Created by Nghia Tran on 12/1/14.
//  Copyright (c) 2014 Fe. All rights reserved.
//

#import "FeData.h"
#import "NSArray+FeRandom.h"
#import "NSDate+FeRandomDate.h"

@interface FeData ()

// Caleandar
@property (strong, nonatomic) NSCalendar *calendar;
@property (strong, nonatomic) NSDate *date;

// Name
@property (strong, nonatomic) NSMutableArray *arrFirstname;
@property (strong, nonatomic) NSMutableArray *arrLastName;
@property (strong, nonatomic) NSMutableArray *arrMiddleName;

// Email
@property (strong, nonatomic) NSMutableArray *arrDomian;

// Address
@property (strong, nonatomic) NSMutableArray *arrAddress;

// Array Product
@property (strong, nonatomic) NSMutableArray *arrProductName;
@end

@implementation FeData
+(instancetype) shareData
{
    static FeData *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[FeData alloc] init];
    });
    
    return instance;
}
-(instancetype) init
{
    self = [super init];
    if (self)
    {
        [self initDumpData];
    }
    return self;
}
-(void) initDumpData
{
    _calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    _date = [NSDate date];
    
    _arrFirstname = [@[@"Nghia",@"An",@"Binh",@"Thinh",@"Hung",@"Huy",@"Nhat",@"Nam",@"Tin",@"Bao",@"Giang",@"Tuan",@"Tu",@"Tuyet",@"Ngoc",@"Nga",@"Minh",@"Linh",@"Tinh",@"Hoang"] mutableCopy];
    
    _arrLastName = [@[@"Tran",@"Nguyen",@"Le",@"Pham",@"Huynh",@"Phan",@"Vu",@"Dang",@"Bui",@"Do",@"Ho",@"Ngo"] mutableCopy];
    
    _arrMiddleName = [@[@"Van",@"Thi",@"Phi",@"Phuong",@"Kim",@"Vinh",@"Dang Thuy",@"Ngoc Hong",@"Ngoc",@"Thuy"] mutableCopy];
    
    _arrDomian = [@[@"gmail.com",@"yahoo.com",@"yahoo.com.vn",@"hotmail.com",@"feels.com",@"quick.com",@"mail.com"] mutableCopy];
    
    _arrAddress = [@[@"Ho Chi Minh",@"Ba Ria Vung Tau",@"Ha Noi",@"Dong Nai",@"Xuyen Moc",@"Thanh Hoa",@"Tien Giang",@"Kien Giang",@"Ca Mau",@"Ha Tien",@"Moc Chau",@"Lai Chau",@"Bac Kan",@"Ha Tinh",@"Ha Dong",@"Da Nang",@"Thua Thien Hue",@"Komtom",@"Daklak",@"Vinh",@"Hai Phong",@"Binh Thuan",@"Phan Rang"] mutableCopy];
    
    _arrProductName = [@[@"Com hop",@"Sua",@"Nuoc Ngot",@"Cocacola",@"Pepsi",@"Mirinda",@"Sting",@"Redbull",@"Aquafina",@"Banh",@"Keo",@"But chi",@"But Muc",@"But bi",@"Chuot May Tinh",@"Ban Phim",@"Man Hinh ",@"Dien Thoati iPhone",@"Dien Thoai Lumina",@"Dien Thoati SamSung",@"PhoMat Con Bo Cuoi",@"Balo",@"LapTop ASUS",@"Laptop Dell",@"Macbook",@"iMac",@"MacMini",@"Ban",@"Bong Den",@"Bong Den",@"Ban",@"Ghe",@"Tu",@"Giuong",@"Quan",@"Ao",@"Khau Trang",@"Kieng",@"Vo",@"Giay",@"Dep",@"Tivi"] mutableCopy];
}
-(NSInteger) randomIndexFrom:(NSInteger) from to:(NSInteger) to
{
    NSInteger min = from;
    NSInteger max = to;
    
    NSInteger randNum = rand() % (max- min) + min; //create the random number.
    
    return randNum;
}
#pragma mark - Customer
-(NSString *) randomName
{
    // First name
    NSString *fullname = [NSString stringWithFormat:@"%@ %@ %@",[_arrLastName randomObject], [_arrMiddleName randomObject], [_arrFirstname randomObject]];
    
    return fullname;
}
-(NSString *) randomCustomerID
{
    NSUUID *uuid = [NSUUID UUID];
    
    return uuid.UUIDString;
}
-(NSString *) randomPhone
{
    return [NSString stringWithFormat:@"%ld",(long)[self randomIndexFrom:100000000 to:900000000]];
}
-(NSString *) randomeEmailWithName:(NSString *)name
{
    NSString *email = [NSString stringWithFormat:@"%@/@%@",name,[_arrDomian randomObject]];
    return email;
}
-(NSString *) randomAddress
{
    NSString *address = (NSString *)[_arrAddress randomObject];
    return address;
}
-(NSDate *) randomBirthday
{
    return [NSDate randomDateFrom:_date WithCalendar:_calendar];
}

#pragma mark - Product
-(NSString *) randomProductName
{
    
}
-(NSString *) randomProductID
{
    
}
@end
