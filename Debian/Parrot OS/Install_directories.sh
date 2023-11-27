#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
ORANGE='\033[0;33m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color


Darknet='~/CyberSec/Darknet'
PGP_Keys='~/CyberSec/Darknet/PGP_Keys'
Bookmarks='~/CyberSec/Darknet/Bookmarks'

Github='~/CyberSec/Github'
Projects='~/CyberSec/Projects'
Reports='~/CyberSec/Reports'
Templates='~/CyberSec/Reports/Templates'

CyberSec='~/CyberSec'
Pwlists='~/CyberSec/Pwlists'
Fuzzing='~/CyberSec/Fuzzing'
XSS='~/CyberSec/Fuzzing/XSS'
Polyglots='~/CyberSec/Fuzzing/XSS/Polyglots'
SQLi='~/CyberSec/Fuzzing/XSS/SQLi'
User-Agents='~/CyberSec/Fuzzing/User-Agents'

Payloads='~/CyberSec/Payloads'
Usernames='~/CyberSec/Usernames'

Discovery='~/CyberSec/Discovery'
URLS='~/CyberSec/Discovery/URLS'
DNS='~/CyberSec/Discovery/Web-Content/DNS'
Web-Content='~/CyberSec/Discovery/Web-Content'
Burpsuit='~/CyberSec/Discovery/Web-Content/Burpsuit'
ParamList='~/CyberSec/Discovery/Web-Content/Burpsuit/Param_lists'


Check_Dependencies () {

    echo -n "Checking dependencies... "
    for name in curl toilet
    do
        [[ $(which $name 2>/dev/null) ]] || { echo -en "\n$name needs to be installed. Use 'sudo apt get install $name'";deps=1; }
    done
        [[ $deps -ne 1 ]] && echo "OK" || { echo -en "\nInstall the above and rerun this script\n";exit 1; }
}


# TODO Make dirs match variables, but simplify it
Dirs () {
    cd ~
    mkdir CyberSec
    cd CyberSec
    mkdir Darknet
    mkdir Github
    mkdir Projects
    mkdir Reports
    #Darknet SubDirs
    cd Darknet && mkdir PGP_Keys && mkdir Bookmarks && cd ~
    #CyberSec SubDirs
    cd CyberSec && mkdir Pwlists && mkdir Fuzzing && mkdir Payloads && mkdir Usernames && mkdir Discovery
    #CyberSec/Descovery/SubDirs
    cd Discovery && mkdir Web-Content && mkdir DNS
    #CyberSec/Web-Content/SubDirs
    cd Web-Content && mkdir -p Burpsuit/Param_lists && mkdir URLS
    # Report SubDirs
    cd Reports && mkdir Templates && mkdir Finished && In_Progress
    ##CyberSec/Fuzzing/SubDirs
    cd ~/CyberSec/Fuzzing && mkdir -p XSS/Polyglots && mkdir User-Agents && mkdir SQLi
}

Download_Files () {
    ############################################################# WORD LISTS #############################################################

    # Password Files
    echo "\n"
    toilet DOWNLOADING PASSWORD LISTS.. -f smblock -w 500
    echo "____________________________________________________"
    cd "$Pwlists"
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/10-million-password-list-top-100.txt --output Top100.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/10-million-password-list-top-500.txt --output Top500.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/10-million-password-list-top-1000.txt --output Top1K.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/10-million-password-list-top-10000.txt --output Top10K.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/10-million-password-list-top-100000.txt --output Top100K.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Common-Credentials/10-million-password-list-top-1000000.txt --output Top1M.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Leaked-Databases/NordVPN.txt --output NordVPN.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Leaked-Databases/muslimMatch.txt --output MuslimMatch.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Leaked-Databases/myspace.txt --output MySpace.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/Leaked-Databases/youporn2012-raw.txt --output YouPorn2012.txt
    curl https://github.com/danielmiessler/SecLists/raw/master/Passwords/Leaked-Databases/rockyou.txt.tar.gz --output rockyou.txt.tar.gz

    #Parameter Lists
    echo "\n"
    toilet DOWNLOADING PARAMETER LISTS.. -f smblock -w 500
    echo "____________________________________________________"
    cd "$ParamList"
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/BurpSuite-ParamMiner/lowercase-headers --output lowercase_headers.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/BurpSuite-ParamMiner/uppercase-headers --output UPPERCASE_HEADERS.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/burp-parameter-names.txt --output BurpParam-Names.txt

    #URL Lists (Sub-directories)
    echo "\n"
    toilet DOWNLOADING URL LISTS.. -f smblock -w 500
    echo "____________________________________________________"
    cd "$URLS"
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/URLs/urls-wordpress-3.3.1.txt --output WordPressURLS.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/URLs/urls-joomla-3.0.3.txt --output JoomlaURLS.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/URLs/urls-SAP.txt --output SapURLS.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/URLs/urls-Drupal-7.20.txt --output DrupalURLS.txt
    
    #Web-Content (General)
    echo "\n"
    toilet DOWNLOADING WEB-CONTENT LISTS.. -f smblock -w 500
    echo "____________________________________________________"
    cd "$Web-Content"
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/web-all-content-types.txt --output All_Web-Content_Types.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/web-extensions.txt --output Web-Extentions.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/web-mutations.txt --output Web-Mutations.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/weblogic.txt --output WebLogic.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Discovery/Web-Content/nginx.txt --output Nginx.txt
    
    # Bug Bounty Templates
    echo "\n"
    toilet DOWNLOADING BUG-BOUNTY REPORT TEMPLATES.. -f smblock -w 500
    echo "____________________________________________________"
    cd "$Templates"
    curl https://raw.githubusercontent.com/ZephrFish/BugBountyTemplates/master/Blank.md --output All_Purpose.md
    curl https://raw.githubusercontent.com/ZephrFish/BugBountyTemplates/master/Example.md --output All_Purpose-EXAMPLE.md
    curl https://raw.githubusercontent.com/ZephrFish/BugBountyTemplates/master/short.md --output All_Purpose-short.md
    echo https://buer.haus/breport/ >> Reportgen.txt
    
    #FUZZING
    echo "\n"
    toilet DOWNLOADING FUZZING LISTS.. -f smblock -w 500
    echo "____________________________________________________"
    cd "$Fuzzing"
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/XSS-Fuzzing --output XSS-Fuzz.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/XXE-Fuzzing.txt --output XXE-Fuzz.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/XML-FUZZ.txt --output XML-Fuzz.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/command-injection-commix.txt --output command-injection.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/country-codes.txt --output country-codes.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/http-request-methods.txt --output http-request-methods.txt
    
    #XSS
    echo "\n"
    toilet DOWNLOADING XSS PAYLOADS.. -f smblock -w 500
    echo "____________________________________________________"
    cd "$XSS"
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/XSS/XSS-BruteLogic.txt --output XSS-BruteLogic.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/XSS/XSS-Bypass-Strings-BruteLogic.txt --output XSS-Bypass-Strings.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/XSS/XSS-With-Context-Jhaddix.txt --output XSS-With-Context-Jhaddix.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/XSS/XSS-Jhaddix.txt --output XSS-Jhaddix.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/XSS/XSS-Cheat-Sheet-PortSwigger.txt --output XSS-Cheat-Sheet-PortSwigger.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/XSS/XSS-OFJAAAH.txt --output XSS-OFJAAAH.txt
    
    #XSS Polyglots
    echo "\n"
    toilet DOWNLOADING XSS POLYGLOTS.. -f smblock -w 500
    echo "____________________________________________________"
    cd "$Polyglots"
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/Polyglots/XSS-Polyglots.txt --output XSS-Polyglots.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/Polyglots/XSS-innerht-ml.txt --output XSS-innerht-ml.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/Polyglots/XSS-Polyglot-Ultimate-0xsobky.txt --output Ultimate-XSS-Polyglot.txt
    
    #SQLi
    echo "\n"
    toilet DOWNLOADING SQLI PAYLOADS.. -f smblock -w 500
    echo "____________________________________________________"
    cd "$SQLi"
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/Polyglots/SQLi-Polyglots.txt --output SQLi-Polyglots.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/SQLi/quick-SQLi.txt --output quick-SQLi.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/SQLi/Generic-SQLi.txt --output Generic-SQLi.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/SQLi/Generic-BlindSQLi.fuzzdb.txt --output Generic-BlindSQLi.fuzzdb.txt
    
    # User-Agents
    echo "\n"
    toilet DOWNLOADING USER-AGENT LISTS.. -f smblock -w 500
    echo "____________________________________________________"
    cd "$User-Agents"
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/User-Agents/user-agents-whatismybrowserdotcom-large.txt --output User-Agents-Large.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/User-Agents/UserAgents-IE.txt --output Internet-Explorer.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/User-Agents/operating-system-name/android.txt --output Android.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/User-Agents/operating-system-name/blackberry-os.txt --output Blackberry.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/User-Agents/operating-system-name/darwin.txt --output Darwin.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/User-Agents/operating-system-name/freebsd.txt --output FreeBSD.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/User-Agents/operating-system-name/ios.txt --output IOS.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/User-Agents/operating-system-name/linux.txt --output Linux.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/User-Agents/operating-system-name/mac-os-x.txt --output MacOS-X.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/User-Agents/operating-system-name/mac.txt --output Macintosh.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/User-Agents/operating-system-name/macos.txt --output MacOS.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/User-Agents/operating-system-name/windows-phone.txt --output windows-phone.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/User-Agents/operating-system-name/windows-mobile.txt --output windows-mobile.txt
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Fuzzing/User-Agents/operating-system-name/windows.txt --output Windows.txt
    
    #Payloads
    echo "\n"
    toilet DOWNLOADING PAYLOADS.. -f smblock -w 500
    echo "____________________________________________________"

    #Usernames
    echo "\n"
    toilet DOWNLOADING USERNAME LISTS.. -f smblock -w 500
    echo "____________________________________________________"

    cd ~/CyberSec/Usernames
    curl https://raw.githubusercontent.com/danielmiessler/SecLists/master/Usernames/xato-net-10-million-usernames.txt --output 10Mil-Usernames.txt
    ##curl file --output file.txt
    #curl file --output file.txt

    ############################################################# PROGRAMMING SUPPORT #############################################################
    # N/A

}


Check_Dependencies
Dirs
Download_Files