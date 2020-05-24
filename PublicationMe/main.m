#import <Foundation/Foundation.h>
#import "SharedInfo.h"

int main(int argc, char *argv[]) {
    NSString *title = @"Titre de la notification";
    NSString *subtitle = @"Sous-titre";
    NSString *section = @"com.apple.Preferences";
    NSString *message = @"Voici le message.";
    {
        int c;
        while ((c = getopt(argc, argv, ":t:s:b:m:")) != -1) {
            switch (c) {
                case 't':
                    title = [NSString stringWithUTF8String:optarg];
                    break;
                case 's':
                    subtitle = [NSString stringWithUTF8String:optarg];
                    break;
                case 'b':
                    section = [NSString stringWithUTF8String:optarg];
                    break;
                case 'm':
                    message = [NSString stringWithUTF8String:optarg];
                    break;
                case '?': {
                    printf("Usage: %s [options]\n"
                           "      -t    Titre           - titre de la notification      (optionel)\n"
                           "                              défaut : \"Titre de la notification\"\n"
                           "      -s    Sous-titre      - sous-titre de la notification (optionel)\n"
                           "                              défaut : \"Sous-titre\"\n"
                           "      -b    BundleID        - bundleID de l'application     (optionel)\n"
                           "                              défaut : \"com.apple.Preferences\"\n"
                           "      -m    Message         - message de la notification    (optionel)\n"
                           "                              défaut : \"Voici le message.\" \n", argv[0]);
                     return 1;
                }
            }
        }
    }
    
    NSDictionary *data = @{
                           kSTBTitleKey : title,
                           kSTBSubitleKey : subtitle,
                           kSTBSectionKey : section,
                           kSTBMessageKey : message,
                           };
    LMConnectionSendOneWayData(&bulletinInfoVessel, 0, (__bridge CFDataRef)LMDataForPropertyList(data));
}
