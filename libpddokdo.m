#import "public/libpddokdo.h"

@interface WALockscreenWidgetViewController : UIViewController
-(id)_temperature;
-(id)_conditionsLine;
-(void)_updateTodayView;
-(void)updateWeather;
-(id)_locationName;
-(id)_conditionsImage;
@end

@interface PDDokdo ()
@property (nonatomic, retain) WALockscreenWidgetViewController *weatherWidget;
@end

@implementation PDDokdo
-(void)initWeatherWidget {
    self.weatherWidget = [[NSClassFromString(@"WALockscreenWidgetViewController") alloc] init];
    [self.weatherWidget updateWeather];
    [self.weatherWidget _updateTodayView];
}

-(NSDictionary *)weatherData {
    [self initWeatherWidget];
 
    NSDictionary *weatherData = nil;
    NSString *temperature = self.weatherWidget._temperature;
    NSString *condition = self.weatherWidget._conditionsLine;
    NSString *location = self.weatherWidget._locationName;
    UIImage *conditionsImage = self.weatherWidget._conditionsImage;
 
    weatherData = @{ @"temperature" : temperature,
                    @"condition" : condition,
                    @"location" : location,
                    @"conditionsImage" : conditionsImage};
 
    return weatherData;
}

-(NSString *)getCurrentTemperature {
    [self initWeatherWidget];
    NSString *temperature = self.weatherWidget._temperature;

    return temperature;
}

-(NSString *)getCurrentConditions {
    [self initWeatherWidget];

    NSString *conditions = self.weatherWidget._conditionsLine;

    return conditions;
}

-(NSString *)getCurrentLocation {
    [self initWeatherWidget];

    NSString *location = self.weatherWidget._locationName;

    return location;
}

-(UIImage *)getCurrentConditionsInImage {
    [self initWeatherWidget];

    UIImage *conditionsImage = self.weatherWidget._conditionsImage;

    return conditionsImage;
}
@end