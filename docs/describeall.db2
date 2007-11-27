describe table EVWBILL.ACCOUNTHOLDERS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ACCOUNTHOLDERID                SYSIBM    INTEGER                   4     0 No    
MERCHANTID                     SYSIBM    INTEGER                   4     0 Yes   
TAXREALMID                     SYSIBM    INTEGER                   4     0 Yes   
ORGANISATIONDN                 SYSIBM    VARCHAR                 255     0 No    
CLIENTNAME                     SYSIBM    VARCHAR                 150     0 Yes   
PRINTCORRESPONDENCE            SYSIBM    INTEGER                   4     0 Yes   
EMAILCORRESPONDENCE            SYSIBM    INTEGER                   4     0 Yes   
FAXCORRESPONDENCE              SYSIBM    INTEGER                   4     0 Yes   
MARKEDFORDELETION              SYSIBM    VARCHAR                   1     0 No    

  9 record(s) selected.


describe table EVWBILL.ACCOUNTHOLDERS_ARCH

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ARCHIVETIMESTAMP               SYSIBM    INTEGER                   4     0 No    
DATEUTC                        SYSIBM    VARCHAR                  20     0 Yes   
ACCOUNTHOLDERID                SYSIBM    INTEGER                   4     0 No    
MERCHANTID                     SYSIBM    INTEGER                   4     0 Yes   
TAXREALMID                     SYSIBM    INTEGER                   4     0 Yes   
ORGANISATIONDN                 SYSIBM    VARCHAR                 255     0 Yes   
CLIENTNAME                     SYSIBM    VARCHAR                  50     0 Yes   
PRINTCORRESPONDENCE            SYSIBM    INTEGER                   4     0 Yes   
EMAILCORRESPONDENCE            SYSIBM    INTEGER                   4     0 Yes   
FAXCORRESPONDENCE              SYSIBM    INTEGER                   4     0 Yes   
MARKEDFORDELETION              SYSIBM    VARCHAR                   1     0 Yes   

  11 record(s) selected.


describe table EVWBILL.ACCOUNTS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ACCOUNTID                      SYSIBM    INTEGER                   4     0 No    
CREDITORID                     SYSIBM    INTEGER                   4     0 Yes   
CREDITORACCOUNT                SYSIBM    INTEGER                   4     0 Yes   
ACCOUNTNAME                    SYSIBM    VARCHAR                  35     0 Yes   
STATEMENTNUM                   SYSIBM    INTEGER                   4     0 Yes   
LASTPRINTEDSTATEMENT           SYSIBM    INTEGER                   4     0 Yes   
ACCOUNTHOLDERID                SYSIBM    INTEGER                   4     0 Yes   
STATUS                         SYSIBM    INTEGER                   4     0 Yes   
CURRENCY                       SYSIBM    VARCHAR                 100     0 Yes   
INSTMINUTE                     SYSIBM    INTEGER                   4     0 Yes   
INSTHOUR                       SYSIBM    INTEGER                   4     0 Yes   
INSTDAY                        SYSIBM    INTEGER                   4     0 Yes   
INSTMONTH                      SYSIBM    INTEGER                   4     0 Yes   
INSTYEAR                       SYSIBM    INTEGER                   4     0 Yes   
OVERDUE120                     SYSIBM    INTEGER                   4     0 Yes   
OVERDUE90                      SYSIBM    INTEGER                   4     0 Yes   
OVERDUE60                      SYSIBM    INTEGER                   4     0 Yes   
OVERDUE30                      SYSIBM    INTEGER                   4     0 Yes   
OVERDUENOW                     SYSIBM    INTEGER                   4     0 Yes   
OVERDUEDAYS                    SYSIBM    INTEGER                   4     0 Yes   
DUETIMESTAMPUTC                SYSIBM    INTEGER                   4     0 Yes   
TAXREALMID                     SYSIBM    INTEGER                   4     0 Yes   

  22 record(s) selected.


describe table EVWBILL.ACCOUNTS_ARCH

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ACCOUNTID                      SYSIBM    INTEGER                   4     0 No    
CREDITORID                     SYSIBM    INTEGER                   4     0 No    
CREDITORACCOUNT                SYSIBM    INTEGER                   4     0 No    
ACCOUNTNAME                    SYSIBM    VARCHAR                  35     0 Yes   
STATEMENTNUM                   SYSIBM    INTEGER                   4     0 Yes   
LASTPRINTEDSTATEMENT           SYSIBM    INTEGER                   4     0 Yes   
ACCOUNTHOLDERID                SYSIBM    INTEGER                   4     0 No    
STATUS                         SYSIBM    INTEGER                   4     0 Yes   
CURRENCY                       SYSIBM    VARCHAR                 100     0 Yes   
INSTMINUTE                     SYSIBM    INTEGER                   4     0 Yes   
INSTHOUR                       SYSIBM    INTEGER                   4     0 Yes   
INSTDAY                        SYSIBM    INTEGER                   4     0 Yes   
INSTMONTH                      SYSIBM    INTEGER                   4     0 Yes   
INSTYEAR                       SYSIBM    INTEGER                   4     0 Yes   
OVERDUE120                     SYSIBM    INTEGER                   4     0 Yes   
OVERDUE90                      SYSIBM    INTEGER                   4     0 Yes   
OVERDUE60                      SYSIBM    INTEGER                   4     0 Yes   
OVERDUE30                      SYSIBM    INTEGER                   4     0 Yes   
OVERDUENOW                     SYSIBM    INTEGER                   4     0 Yes   
OVERDUEDAYS                    SYSIBM    INTEGER                   4     0 Yes   
DUETIMESTAMPUTC                SYSIBM    INTEGER                   4     0 Yes   
TAXREALMID                     SYSIBM    INTEGER                   4     0 Yes   

  22 record(s) selected.


describe table EVWBILL.ACCOUNTS_VIEW

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ACCOUNTID                      SYSIBM    INTEGER                   4     0 No    
CREDITORID                     SYSIBM    INTEGER                   4     0 Yes   
CREDITORACCOUNT                SYSIBM    INTEGER                   4     0 Yes   
ACCOUNTNAME                    SYSIBM    VARCHAR                  35     0 Yes   
STATEMENTNUM                   SYSIBM    INTEGER                   4     0 Yes   
LASTPRINTEDSTATEMENT           SYSIBM    INTEGER                   4     0 Yes   
ACCOUNTHOLDERID                SYSIBM    INTEGER                   4     0 Yes   
STATUS                         SYSIBM    INTEGER                   4     0 Yes   
CURRENCY                       SYSIBM    VARCHAR                 100     0 Yes   
INSTMINUTE                     SYSIBM    INTEGER                   4     0 Yes   
INSTHOUR                       SYSIBM    INTEGER                   4     0 Yes   
INSTDAY                        SYSIBM    INTEGER                   4     0 Yes   
INSTMONTH                      SYSIBM    INTEGER                   4     0 Yes   
INSTYEAR                       SYSIBM    INTEGER                   4     0 Yes   
OVERDUE120                     SYSIBM    INTEGER                   4     0 Yes   
OVERDUE90                      SYSIBM    INTEGER                   4     0 Yes   
OVERDUE60                      SYSIBM    INTEGER                   4     0 Yes   
OVERDUE30                      SYSIBM    INTEGER                   4     0 Yes   
OVERDUENOW                     SYSIBM    INTEGER                   4     0 Yes   
OVERDUEDAYS                    SYSIBM    INTEGER                   4     0 Yes   
DUETIMESTAMPUTC                SYSIBM    INTEGER                   4     0 Yes   
TAXREALMID                     SYSIBM    INTEGER                   4     0 Yes   
OID                            SYSIBM    VARCHAR                 100     0 No    
NAME                           SYSIBM    VARCHAR                  20     0 No    
DESCRIPTION                    SYSIBM    VARCHAR                 100     0 Yes   
MERCHANTID                     SYSIBM    INTEGER                   4     0 Yes   
CLIENTNAME                     SYSIBM    VARCHAR                 150     0 Yes   
MERCHANTACCOUNTID              SYSIBM    INTEGER                   4     0 No    
CLIENTVIEWNAME                 SYSIBM    VARCHAR                 100     0 Yes   

  29 record(s) selected.


describe table EVWBILL.ACCOUNTTYPES_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
OID                            SYSIBM    VARCHAR                 100     0 No    
NAME                           SYSIBM    VARCHAR                  20     0 No    
DESCRIPTION                    SYSIBM    VARCHAR                 100     0 Yes   

  3 record(s) selected.


describe table EVWBILL.EU

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ORGDN                          SYSIBM    VARCHAR                 255     0 Yes   
COUNTRY                        SYSIBM    VARCHAR                   4     0 Yes   

  2 record(s) selected.


describe table EVWBILL.GENERICACCCLIENTACCINFO

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ACCOUNTID                      SYSIBM    INTEGER                   4     0 No    
ACCCUSTOMDATA1                 SYSIBM    VARCHAR                 255     0 Yes   
ACCCUSTOMDATA2                 SYSIBM    VARCHAR                 255     0 Yes   
ACCCUSTOMDATA3                 SYSIBM    VARCHAR                 255     0 Yes   
ACCCUSTOMDATA4                 SYSIBM    VARCHAR                 255     0 Yes   
ACCCUSTOMDATA5                 SYSIBM    VARCHAR                 255     0 Yes   
ACCCUSTOMDATA6                 SYSIBM    VARCHAR                 255     0 Yes   
ACCCUSTOMDATA7                 SYSIBM    VARCHAR                 255     0 Yes   

  8 record(s) selected.


describe table EVWBILL.GENERICACCCLIENTACCINFO_ARCH

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ACCOUNTID                      SYSIBM    INTEGER                   4     0 No    
ACCCUSTOMDATA1                 SYSIBM    VARCHAR                 255     0 Yes   
ACCCUSTOMDATA2                 SYSIBM    VARCHAR                 255     0 Yes   
ACCCUSTOMDATA3                 SYSIBM    VARCHAR                 255     0 Yes   
ACCCUSTOMDATA4                 SYSIBM    VARCHAR                 255     0 Yes   
ACCCUSTOMDATA5                 SYSIBM    VARCHAR                 255     0 Yes   
ACCCUSTOMDATA6                 SYSIBM    VARCHAR                 255     0 Yes   
ACCCUSTOMDATA7                 SYSIBM    VARCHAR                 255     0 Yes   

  8 record(s) selected.


describe table EVWBILL.GENERICACCMERCHACCINFO

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
MERCHANTACCOUNTID              SYSIBM    INTEGER                   4     0 No    
MERCHCUSTOMDATA1               SYSIBM    VARCHAR                 255     0 Yes   
MERCHCUSTOMDATA2               SYSIBM    VARCHAR                 255     0 Yes   
MERCHCUSTOMDATA3               SYSIBM    VARCHAR                 255     0 Yes   
MERCHCUSTOMDATA4               SYSIBM    VARCHAR                 255     0 Yes   
MERCHCUSTOMDATA5               SYSIBM    VARCHAR                 255     0 Yes   
MERCHCUSTOMDATA6               SYSIBM    VARCHAR                 255     0 Yes   
MERCHCUSTOMDATA7               SYSIBM    VARCHAR                 255     0 Yes   
MINBILLABLEAMOUNT              SYSIBM    INTEGER                   4     0 Yes   

  9 record(s) selected.


describe table EVWBILL.GENERICCCAUTHCAPFAIL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
REQARCHAUTHID                  SYSIBM    INTEGER                   4     0 No    
STATUS                         SYSIBM    CHARACTER                 2     0 No    

  2 record(s) selected.


describe table EVWBILL.GENERICCCAUTHCAPFAILREAS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
REQARCHAUTHID                  SYSIBM    INTEGER                   4     0 No    
TIMESTAMP                      SYSIBM    INTEGER                   4     0 No    
DATEUTC                        SYSIBM    VARCHAR                  20     0 No    
GATEWAYMESSAGE                 SYSIBM    VARCHAR                 255     0 No    

  4 record(s) selected.


describe table EVWBILL.GENERICCCAUTHCAPFAILREAS_ARCH

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
REQARCHAUTHID                  SYSIBM    INTEGER                   4     0 No    
TIMESTAMP                      SYSIBM    INTEGER                   4     0 No    
DATEUTC                        SYSIBM    VARCHAR                  20     0 No    
GATEWAYMESSAGE                 SYSIBM    VARCHAR                 255     0 No    

  4 record(s) selected.


describe table EVWBILL.GENERICCCCLIENTACCINFO

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ACCOUNTID                      SYSIBM    INTEGER                   4     0 No    
CARDHOLDERNAME                 SYSIBM    VARCHAR                 100     0 No    
CREDITCARDNUMBER               SYSIBM    VARCHAR                  64     0 No    
LASTFOURDIGITS                 SYSIBM    VARCHAR                  32     0 No    
EXPIRYDATE                     SYSIBM    VARCHAR                  12     0 No    
CVV2                           SYSIBM    VARCHAR                  10     0 Yes   
AVSADDRESSVERIFICATION         SYSIBM    VARCHAR                 255     0 Yes   
AVSCITY                        SYSIBM    VARCHAR                  80     0 Yes   
AVSSTATE                       SYSIBM    VARCHAR                  80     0 Yes   
AVSZIPCODE                     SYSIBM    VARCHAR                  32     0 Yes   
AVSCOUNTRY                     SYSIBM    VARCHAR                  40     0 Yes   
AVSTELEPHONE                   SYSIBM    VARCHAR                  40     0 Yes   
FAX                            SYSIBM    VARCHAR                  40     0 Yes   
EMAIL                          SYSIBM    VARCHAR                  60     0 Yes   
WARNINGSPLASHSCRMSGID          SYSIBM    INTEGER                   4     0 No    
EXPIREDSPLASHSCRMSGID          SYSIBM    INTEGER                   4     0 No    

  16 record(s) selected.


describe table EVWBILL.GENERICCCCLIENTACCINFO_ARCH

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ACCOUNTID                      SYSIBM    INTEGER                   4     0 No    
CARDHOLDERNAME                 SYSIBM    VARCHAR                 100     0 Yes   
CREDITCARDNUMBER               SYSIBM    VARCHAR                  64     0 Yes   
LASTFOURDIGITS                 SYSIBM    VARCHAR                  32     0 Yes   
EXPIRYDATE                     SYSIBM    VARCHAR                  12     0 Yes   
CVV2                           SYSIBM    VARCHAR                  10     0 Yes   
AVSADDRESSVERIFICATION         SYSIBM    VARCHAR                 255     0 Yes   
AVSCITY                        SYSIBM    VARCHAR                  80     0 Yes   
AVSSTATE                       SYSIBM    VARCHAR                  80     0 Yes   
AVSZIPCODE                     SYSIBM    VARCHAR                  32     0 Yes   
AVSCOUNTRY                     SYSIBM    VARCHAR                  40     0 Yes   
AVSTELEPHONE                   SYSIBM    VARCHAR                  40     0 Yes   
FAX                            SYSIBM    VARCHAR                  40     0 Yes   
EMAIL                          SYSIBM    VARCHAR                  60     0 Yes   

  14 record(s) selected.


describe table EVWBILL.GENERICCCIDGENERATOR

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ID                             SYSIBM    INTEGER                   4     0 No    
VALUE                          SYSIBM    CHARACTER                 1     0 No    

  2 record(s) selected.


describe table EVWBILL.GENERICCCMERCHACCINFO

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
MERCHANTACCOUNTID              SYSIBM    INTEGER                   4     0 No    
CLEARINGHOUSEID                SYSIBM    VARCHAR                  40     0 No    
CLEARINGHOUSEMERCHANTID        SYSIBM    VARCHAR                  40     0 No    
CLEARINGHOUSEUSERNAME          SYSIBM    VARCHAR                  40     0 No    
CLEARINGHOUSEPASSWORD          SYSIBM    VARCHAR                  40     0 No    
CUSTOMCLEARINGHOUSEDATA1       SYSIBM    VARCHAR                 255     0 Yes   
CUSTOMCLEARINGHOUSEDATA2       SYSIBM    VARCHAR                 255     0 Yes   
USEAVS                         SYSIBM    INTEGER                   4     0 No    
USECVV2                        SYSIBM    INTEGER                   4     0 No    
USEVETTING                     SYSIBM    INTEGER                   4     0 No    
ACCEPTEDCREDITCARDS            SYSIBM    VARCHAR                 255     0 No    
MINBILLABLEAMOUNT              SYSIBM    INTEGER                   4     0 No    
EMAILONEXPIREDCC               SYSIBM    INTEGER                   4     0 No    
EMAILONTRANSFAILURE            SYSIBM    INTEGER                   4     0 No    

  14 record(s) selected.


describe table EVWBILL.GENERICCCRECURCAPFAILREAS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ACCOUNTID                      SYSIBM    INTEGER                   4     0 No    
BATCHID                        SYSIBM    VARCHAR                 100     0 No    
TIMESTAMP                      SYSIBM    INTEGER                   4     0 No    
DATEUTC                        SYSIBM    VARCHAR                  20     0 No    
GATEWAYMESSAGE                 SYSIBM    VARCHAR                 255     0 No    

  5 record(s) selected.


describe table EVWBILL.GENERICCCRECURCAPREJECTIONS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
BATCHID                        SYSIBM    VARCHAR                 100     0 No    
ACCOUNTID                      SYSIBM    INTEGER                   4     0 No    
AMOUNT                         SYSIBM    INTEGER                   4     0 No    
MERCHANTACCOUNTID              SYSIBM    INTEGER                   4     0 No    
TIMESTAMP                      SYSIBM    INTEGER                   4     0 No    
DATEUTC                        SYSIBM    VARCHAR                  20     0 No    

  6 record(s) selected.


describe table EVWBILL.GENERICCCRECURRINGCAPFAIL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
BATCHID                        SYSIBM    VARCHAR                 100     0 No    
ACCOUNTID                      SYSIBM    INTEGER                   4     0 No    
AMOUNT                         SYSIBM    INTEGER                   4     0 No    
STATUS                         SYSIBM    CHARACTER                 1     0 No    
HOLDREASON                     SYSIBM    VARCHAR                 255     0 Yes   

  5 record(s) selected.


describe table EVWBILL.GENERICCCREFUNDSAWAITFAILREAS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ACCOUNTID                      SYSIBM    INTEGER                   4     0 No    
BATCHID                        SYSIBM    VARCHAR                 100     0 No    
TIMESTAMP                      SYSIBM    INTEGER                   4     0 No    
DATEUTC                        SYSIBM    VARCHAR                  20     0 No    
GATEWAYMESSAGE                 SYSIBM    VARCHAR                 255     0 No    

  5 record(s) selected.


describe table EVWBILL.GENERICCCREFUNDSAWAITING

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
BATCHID                        SYSIBM    VARCHAR                 100     0 No    
ACCOUNTID                      SYSIBM    INTEGER                   4     0 No    
AMOUNT                         SYSIBM    INTEGER                   4     0 No    
STATUS                         SYSIBM    CHARACTER                 2     0 No    

  4 record(s) selected.


describe table EVWBILL.GENERICCCREQUESTAUTH

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
REQAUTHID                      SYSIBM    INTEGER                   4     0 No    
STATUS                         SYSIBM    CHARACTER                 2     0 No    
ACCOUNTID                      SYSIBM    INTEGER                   4     0 Yes   
MERCHANTACCOUNTID              SYSIBM    INTEGER                   4     0 No    
GATEWAYREF                     SYSIBM    VARCHAR                 150     0 No    
TIMESTAMP                      SYSIBM    INTEGER                   4     0 No    
DATEUTC                        SYSIBM    VARCHAR                  20     0 No    
GATEWAYAVSDATA                 SYSIBM    VARCHAR                  40     0 Yes   
GATEWAYCVV2DATA                SYSIBM    VARCHAR                  40     0 Yes   
GATEWAYMESSAGE                 SYSIBM    VARCHAR                 255     0 No    
CARDHOLDERNAME                 SYSIBM    VARCHAR                 100     0 No    
CREDITCARDNUMBER               SYSIBM    VARCHAR                  32     0 No    
EXPIRYDATE                     SYSIBM    VARCHAR                  12     0 No    
CVV2                           SYSIBM    VARCHAR                  10     0 Yes   
SOURCEREF                      SYSIBM    VARCHAR                 100     0 No    
AMOUNT                         SYSIBM    INTEGER                   4     0 No    
CURRENCY                       SYSIBM    VARCHAR                  15     0 No    
AVSADDRESSVERIFICATION         SYSIBM    VARCHAR                 255     0 Yes   
AVSCITY                        SYSIBM    VARCHAR                  80     0 Yes   
AVSSTATE                       SYSIBM    VARCHAR                  80     0 Yes   
AVSZIPCODE                     SYSIBM    VARCHAR                  32     0 Yes   
AVSCOUNTRY                     SYSIBM    VARCHAR                  40     0 Yes   
AVSTELEPHONE                   SYSIBM    VARCHAR                  40     0 Yes   
FAX                            SYSIBM    VARCHAR                  40     0 Yes   
EMAIL                          SYSIBM    VARCHAR                  60     0 Yes   

  25 record(s) selected.


describe table EVWBILL.GENERICCCREQUESTAUTH_ARCH

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
REQAUTHID                      SYSIBM    INTEGER                   4     0 No    
STATUS                         SYSIBM    CHARACTER                 2     0 No    
ACCOUNTID                      SYSIBM    INTEGER                   4     0 Yes   
MERCHANTACCOUNTID              SYSIBM    INTEGER                   4     0 No    
GATEWAYREF                     SYSIBM    VARCHAR                 150     0 No    
TIMESTAMP                      SYSIBM    INTEGER                   4     0 No    
DATEUTC                        SYSIBM    VARCHAR                  20     0 No    
GATEWAYAVSDATA                 SYSIBM    VARCHAR                  40     0 Yes   
GATEWAYCVV2DATA                SYSIBM    VARCHAR                  40     0 Yes   
GATEWAYMESSAGE                 SYSIBM    VARCHAR                 255     0 No    
CARDHOLDERNAME                 SYSIBM    VARCHAR                 100     0 No    
CREDITCARDNUMBER               SYSIBM    VARCHAR                  64     0 No    
LASTFOURDIGITS                 SYSIBM    VARCHAR                  32     0 No    
EXPIRYDATE                     SYSIBM    VARCHAR                  12     0 No    
CVV2                           SYSIBM    VARCHAR                  10     0 Yes   
SOURCEREF                      SYSIBM    VARCHAR                 100     0 No    
AMOUNT                         SYSIBM    INTEGER                   4     0 No    
CURRENCY                       SYSIBM    VARCHAR                  15     0 No    
AVSADDRESSVERIFICATION         SYSIBM    VARCHAR                 255     0 Yes   
AVSCITY                        SYSIBM    VARCHAR                  80     0 Yes   
AVSSTATE                       SYSIBM    VARCHAR                  80     0 Yes   
AVSZIPCODE                     SYSIBM    VARCHAR                  32     0 Yes   
AVSCOUNTRY                     SYSIBM    VARCHAR                  40     0 Yes   
AVSTELEPHONE                   SYSIBM    VARCHAR                  40     0 Yes   
FAX                            SYSIBM    VARCHAR                  40     0 Yes   
EMAIL                          SYSIBM    VARCHAR                  60     0 Yes   

  26 record(s) selected.


describe table EVWBILL.GENERICCCTRANSACTIONLOG

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
CCLOGID                        SYSIBM    INTEGER                   4     0 No    
TRANSACTIONTYPE                SYSIBM    VARCHAR                  20     0 No    
STATUS                         SYSIBM    CHARACTER                 2     0 No    
EVWREF                         SYSIBM    VARCHAR                  16     0 Yes   
MERCHANTACCOUNTID              SYSIBM    INTEGER                   4     0 No    
ACCOUNTID                      SYSIBM    INTEGER                   4     0 Yes   
TIMESTAMP                      SYSIBM    INTEGER                   4     0 No    
DATEUTC                        SYSIBM    VARCHAR                  20     0 No    
CARDHOLDERNAME                 SYSIBM    VARCHAR                 100     0 No    
CREDITCARDNUMBER               SYSIBM    VARCHAR                  64     0 No    
LASTFOURDIGITS                 SYSIBM    VARCHAR                  32     0 No    
EXPIRYDATE                     SYSIBM    VARCHAR                  12     0 No    
CVV2                           SYSIBM    VARCHAR                  10     0 Yes   
AVSDATA                        SYSIBM    VARCHAR                 255     0 Yes   
AMOUNT                         SYSIBM    INTEGER                   4     0 No    
JOURNALIMPACT                  SYSIBM    INTEGER                   4     0 No    
GATEWAYREF                     SYSIBM    VARCHAR                 150     0 No    
GATEWAYMESSAGE                 SYSIBM    VARCHAR                 255     0 No    

  18 record(s) selected.


describe table EVWBILL.GENERICCCTRANSACTIONLOG_ARCH

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
CCLOGID                        SYSIBM    INTEGER                   4     0 No    
TRANSACTIONTYPE                SYSIBM    VARCHAR                  20     0 Yes   
STATUS                         SYSIBM    CHARACTER                 2     0 Yes   
EVWREF                         SYSIBM    VARCHAR                  16     0 Yes   
MERCHANTACCOUNTID              SYSIBM    INTEGER                   4     0 Yes   
ACCOUNTID                      SYSIBM    INTEGER                   4     0 Yes   
TIMESTAMP                      SYSIBM    INTEGER                   4     0 Yes   
DATEUTC                        SYSIBM    VARCHAR                  20     0 Yes   
CARDHOLDERNAME                 SYSIBM    VARCHAR                 100     0 Yes   
CREDITCARDNUMBER               SYSIBM    VARCHAR                  64     0 Yes   
LASTFOURDIGITS                 SYSIBM    VARCHAR                  32     0 Yes   
EXPIRYDATE                     SYSIBM    VARCHAR                  12     0 Yes   
CVV2                           SYSIBM    VARCHAR                  10     0 Yes   
AVSDATA                        SYSIBM    VARCHAR                 255     0 Yes   
AMOUNT                         SYSIBM    INTEGER                   4     0 Yes   
JOURNALIMPACT                  SYSIBM    INTEGER                   4     0 Yes   
GATEWAYREF                     SYSIBM    VARCHAR                 150     0 Yes   
GATEWAYMESSAGE                 SYSIBM    VARCHAR                 255     0 Yes   

  18 record(s) selected.


describe table EVWBILL.GENERICCCVETTING

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
REQAUTHID                      SYSIBM    INTEGER                   4     0 No    
STATUS                         SYSIBM    CHARACTER                 2     0 No    
TYPE                           SYSIBM    CHARACTER                 2     0 No    

  3 record(s) selected.


describe table EVWBILL.GENERICCCVETTING_ARCH

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
REQAUTHID                      SYSIBM    INTEGER                   4     0 No    
STATUS                         SYSIBM    CHARACTER                 2     0 No    
TYPE                           SYSIBM    CHARACTER                 2     0 No    

  3 record(s) selected.


describe table EVWBILL.HASHING_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ACCOUNTHOLDERID                SYSIBM    INTEGER                   4     0 No    
MERCHANTACCOUNTID              SYSIBM    INTEGER                   4     0 No    
CLIENTNAME                     SYSIBM    VARCHAR                  50     0 No    

  3 record(s) selected.


describe table EVWBILL.INSTALLED

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
PRODUCTID                      SYSIBM    INTEGER                   4     0 No    
PRODUCTTYPE                    SYSIBM    INTEGER                   4     0 Yes   
INSTALLEDID                    SYSIBM    VARCHAR                  50     0 Yes   
PRODUCTCOSTID                  SYSIBM    VARCHAR                  25     0 Yes   
COMPONENTID                    SYSIBM    VARCHAR                  50     0 Yes   
TEMPLATEID                     SYSIBM    INTEGER                   4     0 Yes   
INSTMINUTE                     SYSIBM    INTEGER                   4     0 Yes   
INSTHOUR                       SYSIBM    INTEGER                   4     0 Yes   
INSTDAY                        SYSIBM    INTEGER                   4     0 Yes   
INSTMONTH                      SYSIBM    INTEGER                   4     0 Yes   
INSTYEAR                       SYSIBM    INTEGER                   4     0 Yes   
UTCTIMESTAMP                   SYSIBM    INTEGER                   4     0 Yes   
DESCRIPTION                    SYSIBM    VARCHAR                 100     0 Yes   
PURCHASERDN                    SYSIBM    VARCHAR                 255     0 Yes   
SALESPERSONDN                  SYSIBM    VARCHAR                 255     0 Yes   
ACCOUNTID                      SYSIBM    INTEGER                   4     0 Yes   
DIFFDAYS                       SYSIBM    DOUBLE                    8     0 Yes   
COSTCOMPONENTNAME              SYSIBM    VARCHAR                 100     0 Yes   
STATUS                         SYSIBM    INTEGER                   4     0 Yes   

  19 record(s) selected.


describe table EVWBILL.INSTALLED_ARCH

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
PRODUCTID                      SYSIBM    INTEGER                   4     0 No    
PRODUCTTYPE                    SYSIBM    INTEGER                   4     0 Yes   
INSTALLEDID                    SYSIBM    VARCHAR                  50     0 Yes   
PRODUCTCOSTID                  SYSIBM    VARCHAR                  25     0 Yes   
COMPONENTID                    SYSIBM    VARCHAR                  50     0 Yes   
TEMPLATEID                     SYSIBM    INTEGER                   4     0 Yes   
INSTMINUTE                     SYSIBM    INTEGER                   4     0 Yes   
INSTHOUR                       SYSIBM    INTEGER                   4     0 Yes   
INSTDAY                        SYSIBM    INTEGER                   4     0 Yes   
INSTMONTH                      SYSIBM    INTEGER                   4     0 Yes   
INSTYEAR                       SYSIBM    INTEGER                   4     0 Yes   
UTCTIMESTAMP                   SYSIBM    INTEGER                   4     0 Yes   
DESCRIPTION                    SYSIBM    VARCHAR                 100     0 Yes   
PURCHASERDN                    SYSIBM    VARCHAR                 255     0 Yes   
SALESPERSONDN                  SYSIBM    VARCHAR                 255     0 Yes   
ACCOUNTID                      SYSIBM    INTEGER                   4     0 No    
DIFFDAYS                       SYSIBM    DOUBLE                    8     0 Yes   
COSTCOMPONENTNAME              SYSIBM    VARCHAR                 100     0 Yes   
STATUS                         SYSIBM    INTEGER                   4     0 Yes   

  19 record(s) selected.


describe table EVWBILL.INVOICES_ARCH

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
INVOICEID                      SYSIBM    INTEGER                   4     0 No    
MERCHANTID                     SYSIBM    INTEGER                   4     0 Yes   
INVOICENUM                     SYSIBM    INTEGER                   4     0 Yes   
UTCTIMESTAMP                   SYSIBM    INTEGER                   4     0 Yes   
PRINTED                        SYSIBM    INTEGER                   4     0 Yes   
MERCHANTNAME                   SYSIBM    VARCHAR                  50     0 Yes   
MERCHANTTEL                    SYSIBM    VARCHAR                  20     0 Yes   
MERCHANTFAX                    SYSIBM    VARCHAR                  20     0 Yes   
MERCHANTEMAIL                  SYSIBM    VARCHAR                 100     0 Yes   
MERCHANTPOSTAL1                SYSIBM    VARCHAR                 100     0 Yes   
MERCHANTPOSTAL2                SYSIBM    VARCHAR                 100     0 Yes   
MERCHANTPOSTALCITY             SYSIBM    VARCHAR                 100     0 Yes   
MERCHANTPOSTALSTATE            SYSIBM    VARCHAR                  20     0 Yes   
MERCHANTPOSTALCOUNTRY          SYSIBM    VARCHAR                  20     0 Yes   
MERCHANTPOSTALZIPCODE          SYSIBM    VARCHAR                  10     0 Yes   
MERCHANTSTREET1                SYSIBM    VARCHAR                 100     0 Yes   
MERCHANTSTREET2                SYSIBM    VARCHAR                 100     0 Yes   
MERCHANTSTREETCITY             SYSIBM    VARCHAR                 100     0 Yes   
MERCHANTSTREETSTATE            SYSIBM    VARCHAR                  20     0 Yes   
MERCHANTSTREETCOUNTRY          SYSIBM    VARCHAR                  20     0 Yes   
MERCHANTSTREETZIPCODE          SYSIBM    VARCHAR                  10     0 Yes   
ACCOUNTID                      SYSIBM    INTEGER                   4     0 No    
CLIENTNAME                     SYSIBM    VARCHAR                  50     0 Yes   
CLIENTTEL                      SYSIBM    VARCHAR                  20     0 Yes   
CLIENTFAX                      SYSIBM    VARCHAR                  20     0 Yes   
CLIENTEMAIL                    SYSIBM    VARCHAR                 100     0 Yes   
CLIENTPOSTAL1                  SYSIBM    VARCHAR                 100     0 Yes   
CLIENTPOSTAL2                  SYSIBM    VARCHAR                 100     0 Yes   
CLIENTPOSTALCITY               SYSIBM    VARCHAR                 100     0 Yes   
CLIENTPOSTALSTATE              SYSIBM    VARCHAR                  20     0 Yes   
CLIENTPOSTALCOUNTRY            SYSIBM    VARCHAR                  20     0 Yes   
CLIENTPOSTALZIPCODE            SYSIBM    VARCHAR                  10     0 Yes   
CLIENTSTREET1                  SYSIBM    VARCHAR                 100     0 Yes   
CLIENTSTREET2                  SYSIBM    VARCHAR                 100     0 Yes   
CLIENTSTREETCITY               SYSIBM    VARCHAR                 100     0 Yes   
CLIENTSTREETSTATE              SYSIBM    VARCHAR                  20     0 Yes   
CLIENTSTREETCOUNTRY            SYSIBM    VARCHAR                  20     0 Yes   
CLIENTSTREETZIPCODE            SYSIBM    VARCHAR                  10     0 Yes   

  38 record(s) selected.


describe table EVWBILL.INVOICES_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
INVOICEID                      SYSIBM    INTEGER                   4     0 No    
MERCHANTID                     SYSIBM    INTEGER                   4     0 Yes   
INVOICENUM                     SYSIBM    INTEGER                   4     0 Yes   
UTCTIMESTAMP                   SYSIBM    INTEGER                   4     0 Yes   
PRINTED                        SYSIBM    INTEGER                   4     0 Yes   
MERCHANTNAME                   SYSIBM    VARCHAR                  50     0 Yes   
MERCHANTTEL                    SYSIBM    VARCHAR                  20     0 Yes   
MERCHANTFAX                    SYSIBM    VARCHAR                  20     0 Yes   
MERCHANTEMAIL                  SYSIBM    VARCHAR                 100     0 Yes   
MERCHANTPOSTAL1                SYSIBM    VARCHAR                 100     0 Yes   
MERCHANTPOSTAL2                SYSIBM    VARCHAR                 100     0 Yes   
MERCHANTPOSTALCITY             SYSIBM    VARCHAR                 100     0 Yes   
MERCHANTPOSTALSTATE            SYSIBM    VARCHAR                  20     0 Yes   
MERCHANTPOSTALCOUNTRY          SYSIBM    VARCHAR                  20     0 Yes   
MERCHANTPOSTALZIPCODE          SYSIBM    VARCHAR                  10     0 Yes   
MERCHANTSTREET1                SYSIBM    VARCHAR                 100     0 Yes   
MERCHANTSTREET2                SYSIBM    VARCHAR                 100     0 Yes   
MERCHANTSTREETCITY             SYSIBM    VARCHAR                 100     0 Yes   
MERCHANTSTREETSTATE            SYSIBM    VARCHAR                  20     0 Yes   
MERCHANTSTREETCOUNTRY          SYSIBM    VARCHAR                  20     0 Yes   
MERCHANTSTREETZIPCODE          SYSIBM    VARCHAR                  10     0 Yes   
ACCOUNTID                      SYSIBM    INTEGER                   4     0 Yes   
CLIENTNAME                     SYSIBM    VARCHAR                  50     0 Yes   
CLIENTTEL                      SYSIBM    VARCHAR                  20     0 Yes   
CLIENTFAX                      SYSIBM    VARCHAR                  20     0 Yes   
CLIENTEMAIL                    SYSIBM    VARCHAR                 100     0 Yes   
CLIENTPOSTAL1                  SYSIBM    VARCHAR                 100     0 Yes   
CLIENTPOSTAL2                  SYSIBM    VARCHAR                 100     0 Yes   
CLIENTPOSTALCITY               SYSIBM    VARCHAR                 100     0 Yes   
CLIENTPOSTALSTATE              SYSIBM    VARCHAR                  20     0 Yes   
CLIENTPOSTALCOUNTRY            SYSIBM    VARCHAR                  20     0 Yes   
CLIENTPOSTALZIPCODE            SYSIBM    VARCHAR                  10     0 Yes   
CLIENTSTREET1                  SYSIBM    VARCHAR                 100     0 Yes   
CLIENTSTREET2                  SYSIBM    VARCHAR                 100     0 Yes   
CLIENTSTREETCITY               SYSIBM    VARCHAR                 100     0 Yes   
CLIENTSTREETSTATE              SYSIBM    VARCHAR                  20     0 Yes   
CLIENTSTREETCOUNTRY            SYSIBM    VARCHAR                  20     0 Yes   
CLIENTSTREETZIPCODE            SYSIBM    VARCHAR                  10     0 Yes   

  38 record(s) selected.


describe table EVWBILL.JOURNAL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
JOURNALID                      SYSIBM    INTEGER                   4     0 No    
ACCOUNTID                      SYSIBM    INTEGER                   4     0 No    
JOURNALTIMESTAMP               SYSIBM    INTEGER                   4     0 Yes   
ENTRYTYPE                      SYSIBM    INTEGER                   4     0 Yes   
ISTAXABLE                      SYSIBM    INTEGER                   4     0 Yes   
AMOUNTPRETAX                   SYSIBM    INTEGER                   4     0 Yes   
TAX                            SYSIBM    INTEGER                   4     0 Yes   
AMOUNT                         SYSIBM    INTEGER                   4     0 Yes   
BALANCE                        SYSIBM    INTEGER                   4     0 Yes   
DESCRIPTION                    SYSIBM    VARCHAR                 100     0 Yes   
INVOICEID                      SYSIBM    INTEGER                   4     0 Yes   
STATEMENTNUM                   SYSIBM    INTEGER                   4     0 Yes   
DEBITID                        SYSIBM    INTEGER                   4     0 Yes   
PRODUCTDN                      SYSIBM    VARCHAR                 100     0 Yes   
PRODUCTTYPE                    SYSIBM    VARCHAR                 100     0 Yes   
PRODUCTOID                     SYSIBM    VARCHAR                 100     0 Yes   
UNITTYPE                       SYSIBM    VARCHAR                 100     0 Yes   
UNITDESCRIPTION                SYSIBM    VARCHAR                 100     0 Yes   
TOTALUNITS                     SYSIBM    INTEGER                   4     0 Yes   
COSTCOMPONENTNAME              SYSIBM    VARCHAR                 100     0 Yes   
COMPONENTID                    SYSIBM    VARCHAR                 100     0 Yes   
PRODUCTCOSTID                  SYSIBM    VARCHAR                 100     0 Yes   
BATCHID                        SYSIBM    VARCHAR                 100     0 Yes   
REFERENCEID                    SYSIBM    VARCHAR                 100     0 Yes   
DATEUTC                        SYSIBM    VARCHAR                  20     0 Yes   

  25 record(s) selected.


describe table EVWBILL.JOURNAL_ARCH

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
JOURNALID                      SYSIBM    INTEGER                   4     0 No    
ACCOUNTID                      SYSIBM    INTEGER                   4     0 No    
JOURNALTIMESTAMP               SYSIBM    INTEGER                   4     0 Yes   
ENTRYTYPE                      SYSIBM    INTEGER                   4     0 Yes   
ISTAXABLE                      SYSIBM    INTEGER                   4     0 Yes   
AMOUNTPRETAX                   SYSIBM    INTEGER                   4     0 Yes   
TAX                            SYSIBM    INTEGER                   4     0 Yes   
AMOUNT                         SYSIBM    INTEGER                   4     0 Yes   
BALANCE                        SYSIBM    INTEGER                   4     0 Yes   
DESCRIPTION                    SYSIBM    VARCHAR                 100     0 Yes   
INVOICEID                      SYSIBM    INTEGER                   4     0 Yes   
STATEMENTNUM                   SYSIBM    INTEGER                   4     0 Yes   
DEBITID                        SYSIBM    INTEGER                   4     0 Yes   
PRODUCTDN                      SYSIBM    VARCHAR                 100     0 Yes   
PRODUCTTYPE                    SYSIBM    VARCHAR                 100     0 Yes   
PRODUCTOID                     SYSIBM    VARCHAR                 100     0 Yes   
UNITTYPE                       SYSIBM    VARCHAR                 100     0 Yes   
UNITDESCRIPTION                SYSIBM    VARCHAR                 100     0 Yes   
TOTALUNITS                     SYSIBM    INTEGER                   4     0 Yes   
COSTCOMPONENTNAME              SYSIBM    VARCHAR                 100     0 Yes   
COMPONENTID                    SYSIBM    VARCHAR                 100     0 Yes   
PRODUCTCOSTID                  SYSIBM    VARCHAR                 100     0 Yes   
BATCHID                        SYSIBM    VARCHAR                 100     0 Yes   
REFERENCEID                    SYSIBM    VARCHAR                 100     0 Yes   
DATEUTC                        SYSIBM    VARCHAR                  20     0 Yes   

  25 record(s) selected.


describe table EVWBILL.JOURNALADJUSTMENT_ARCH

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
JOURNALADJID                   SYSIBM    INTEGER                   4     0 No    
JOURNALID                      SYSIBM    INTEGER                   4     0 Yes   
DIFFDAYS                       SYSIBM    DOUBLE                    8     0 Yes   
INITIALAMOUNT                  SYSIBM    INTEGER                   4     0 Yes   
ADJUSTEDAMOUNT                 SYSIBM    INTEGER                   4     0 Yes   
COSTTYPE                       SYSIBM    VARCHAR                 100     0 Yes   
TIMESTAMPUTC                   SYSIBM    INTEGER                   4     0 Yes   
DATEUTC                        SYSIBM    VARCHAR                  20     0 Yes   

  8 record(s) selected.


describe table EVWBILL.JOURNALADJUSTMENT_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
JOURNALADJID                   SYSIBM    INTEGER                   4     0 No    
JOURNALID                      SYSIBM    INTEGER                   4     0 No    
DIFFDAYS                       SYSIBM    DOUBLE                    8     0 No    
INITIALAMOUNT                  SYSIBM    INTEGER                   4     0 No    
ADJUSTEDAMOUNT                 SYSIBM    INTEGER                   4     0 No    
COSTTYPE                       SYSIBM    VARCHAR                 100     0 No    
TIMESTAMPUTC                   SYSIBM    INTEGER                   4     0 No    
DATEUTC                        SYSIBM    VARCHAR                  20     0 No    

  8 record(s) selected.


describe table EVWBILL.MERCHANTACCOUNTS_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
MERCHANTACCOUNTID              SYSIBM    INTEGER                   4     0 No    
MERCHANTID                     SYSIBM    INTEGER                   4     0 Yes   
MERCHANTOID                    SYSIBM    VARCHAR                 100     0 No    
CLIENTVIEWNAME                 SYSIBM    VARCHAR                 100     0 Yes   
CURRENCY                       SYSIBM    VARCHAR                 100     0 Yes   
EXPONENT                       SYSIBM    INTEGER                   4     0 Yes   
STATUS                         SYSIBM    INTEGER                   4     0 Yes   
REFUNDADVANCECHARGES           SYSIBM    INTEGER                   4     0 Yes   
BILLFULLSETUP                  SYSIBM    INTEGER                   4     0 Yes   
ENABLEBILLINGNODES             SYSIBM    INTEGER                   4     0 Yes   
ENABLEPRORATEINADVANCE         SYSIBM    INTEGER                   4     0 Yes   
ENABLEPRORATEINARREARS         SYSIBM    INTEGER                   4     0 Yes   
MAXCAPTUREAMOUNT               SYSIBM    INTEGER                   4     0 No    
ENABLEAUTOSTATROLLOVER         SYSIBM    INTEGER                   4     0 No    
ENABLEAUTOINVRUN               SYSIBM    INTEGER                   4     0 No    

  15 record(s) selected.


describe table EVWBILL.MERCHANTACCOUNTS_VIEW

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
MERCHANTID                     SYSIBM    INTEGER                   4     0 Yes   
MERCHANTACCOUNTID              SYSIBM    INTEGER                   4     0 No    
OID                            SYSIBM    VARCHAR                 100     0 No    
ACCOUNTID                      SYSIBM    INTEGER                   4     0 No    

  4 record(s) selected.


describe table EVWBILL.MERCHANTS_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
MERCHANTID                     SYSIBM    INTEGER                   4     0 No    
MERCHANTNAME                   SYSIBM    VARCHAR                 100     0 No    
ISPDN                          SYSIBM    VARCHAR                 255     0 No    
MERCHANTDN                     SYSIBM    VARCHAR                 255     0 No    
TAXREALMID                     SYSIBM    INTEGER                   4     0 No    
RESELLERFLAG                   SYSIBM    VARCHAR                   1     0 No    

  6 record(s) selected.


describe table EVWBILL.MOVEMENTSDUE

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
MOVEMENTSDUEID                 SYSIBM    INTEGER                   4     0 No    
ACCOUNTID                      SYSIBM    INTEGER                   4     0 Yes   
REFERENCE                      SYSIBM    VARCHAR                 100     0 Yes   
BATCHID                        SYSIBM    INTEGER                   4     0 Yes   
AMOUNT                         SYSIBM    INTEGER                   4     0 Yes   
CAPTUREDTIMESTAMP              SYSIBM    INTEGER                   4     0 Yes   
DESCRIPTION                    SYSIBM    VARCHAR                 100     0 Yes   

  7 record(s) selected.


describe table EVWBILL.MOVEMENTSDUE_ARCH

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
MOVEMENTSDUEID                 SYSIBM    INTEGER                   4     0 No    
ACCOUNTID                      SYSIBM    INTEGER                   4     0 No    
REFERENCE                      SYSIBM    VARCHAR                 100     0 Yes   
BATCHID                        SYSIBM    INTEGER                   4     0 Yes   
AMOUNT                         SYSIBM    INTEGER                   4     0 Yes   
CAPTUREDTIMESTAMP              SYSIBM    INTEGER                   4     0 Yes   
DESCRIPTION                    SYSIBM    VARCHAR                 100     0 Yes   

  7 record(s) selected.


describe table EVWBILL.MOVEMENTSDUE_VIEW

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ACCOUNTID                      SYSIBM    INTEGER                   4     0 No    
ACCOUNTNAME                    SYSIBM    VARCHAR                  35     0 Yes   
OVERDUENOW                     SYSIBM    INTEGER                   4     0 Yes   
CREDITORACCOUNT                SYSIBM    INTEGER                   4     0 Yes   

  4 record(s) selected.


describe table EVWBILL.ORGANIZATIONDETAILS_ARCH

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ACCOUNTHOLDERID                SYSIBM    INTEGER                   4     0 No    
STREET1                        SYSIBM    VARCHAR                 255     0 Yes   
STREET2                        SYSIBM    VARCHAR                 255     0 Yes   
STREETCITY                     SYSIBM    VARCHAR                 100     0 Yes   
STREETZIP                      SYSIBM    VARCHAR                  25     0 Yes   
STREETSTATE                    SYSIBM    VARCHAR                 100     0 Yes   
STREETCOUNTRY                  SYSIBM    VARCHAR                 100     0 Yes   
POSTAL1                        SYSIBM    VARCHAR                 255     0 Yes   
POSTAL2                        SYSIBM    VARCHAR                 255     0 Yes   
POSTALCITY                     SYSIBM    VARCHAR                 100     0 Yes   
POSTALZIP                      SYSIBM    VARCHAR                  25     0 Yes   
POSTALSTATE                    SYSIBM    VARCHAR                 100     0 Yes   
POSTALCOUNTRY                  SYSIBM    VARCHAR                 100     0 Yes   
TEL                            SYSIBM    VARCHAR                  30     0 Yes   
FAX                            SYSIBM    VARCHAR                  30     0 Yes   
EMAIL                          SYSIBM    VARCHAR                  60     0 Yes   

  16 record(s) selected.


describe table EVWBILL.PAYMENTPROFILE_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
PAYMENTPROFILEID               SYSIBM    INTEGER                   4     0 No    
MERCHANTID                     SYSIBM    INTEGER                   4     0 Yes   
DAYSOVERDUE                    SYSIBM    INTEGER                   4     0 Yes   
MAILTOCLIENT                   SYSIBM    INTEGER                   4     0 Yes   
EXTERNALEMAIL                  SYSIBM    VARCHAR                  50     0 Yes   
SUBJECT                        SYSIBM    VARCHAR                 100     0 Yes   
EMAILMESSAGE                   SYSIBM    VARCHAR                1500     0 Yes   

  7 record(s) selected.


describe table EVWBILL.PAYMENTPROFILE_VIEW

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ACCOUNTID                      SYSIBM    INTEGER                   4     0 No    
ACCOUNTNAME                    SYSIBM    VARCHAR                  35     0 Yes   
OVERDUENOW                     SYSIBM    INTEGER                   4     0 Yes   
OVERDUE30                      SYSIBM    INTEGER                   4     0 Yes   
OVERDUE60                      SYSIBM    INTEGER                   4     0 Yes   
OVERDUE90                      SYSIBM    INTEGER                   4     0 Yes   
OVERDUE120                     SYSIBM    INTEGER                   4     0 Yes   
ACCOUNTHOLDERID                SYSIBM    INTEGER                   4     0 Yes   
OVERDUEDAYS                    SYSIBM    INTEGER                   4     0 Yes   
MAILTOCLIENT                   SYSIBM    INTEGER                   4     0 Yes   
EXTERNALEMAIL                  SYSIBM    VARCHAR                  50     0 Yes   
SUBJECT                        SYSIBM    VARCHAR                 100     0 Yes   
EMAILMESSAGE                   SYSIBM    VARCHAR                1500     0 Yes   

  13 record(s) selected.


describe table EVWBILL.RECURRINGCHARGECAPVETTING

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
BATCHID                        SYSIBM    VARCHAR                 100     0 No    
ACCOUNTID                      SYSIBM    INTEGER                   4     0 No    
AMOUNT                         SYSIBM    INTEGER                   4     0 No    
STATUS                         SYSIBM    CHARACTER                 2     0 No    

  4 record(s) selected.


describe table EVWBILL.RECURRINGCHARGEEVENT

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ACCOUNTID                      SYSIBM    INTEGER                   4     0 No    
TEMPLATEID                     SYSIBM    INTEGER                   4     0 No    
INSTALLEDPACKAGEID             SYSIBM    VARCHAR                 255     0 No    
PRODUCTID                      SYSIBM    VARCHAR                 255     0 Yes   
COSTPROFILEID                  SYSIBM    VARCHAR                 255     0 Yes   
AMOUNT                         SYSIBM    INTEGER                   4     0 Yes   
BILLINGDATE                    SYSIBM    VARCHAR                 255     0 No    

  7 record(s) selected.


describe table EVWBILL.RECURRINGCHARGESTATUS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ACCOUNTID                      SYSIBM    INTEGER                   4     0 No    
INSTALLEDID                    SYSIBM    VARCHAR                  50     0 No    
STATUS                         SYSIBM    INTEGER                   4     0 No    
REASON                         SYSIBM    VARCHAR                 255     0 No    
TIMESTAMPUTC                   SYSIBM    INTEGER                   4     0 No    
DATEUTC                        SYSIBM    VARCHAR                  20     0 No    

  6 record(s) selected.


describe table EVWBILL.SCHEDULES

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
SCHEDULESID                    SYSIBM    INTEGER                   4     0 No    
TEMPLATEID                     SYSIBM    INTEGER                   4     0 Yes   
SEQINDEX                       SYSIBM    VARCHAR                  25     0 Yes   
HOURFROM                       SYSIBM    INTEGER                   4     0 Yes   
DAYFROM                        SYSIBM    INTEGER                   4     0 Yes   
MONTHFROM                      SYSIBM    INTEGER                   4     0 Yes   
YEARFROM                       SYSIBM    INTEGER                   4     0 Yes   
HOURTO                         SYSIBM    INTEGER                   4     0 Yes   
DAYTO                          SYSIBM    INTEGER                   4     0 Yes   
MONTHTO                        SYSIBM    INTEGER                   4     0 Yes   
YEARTO                         SYSIBM    INTEGER                   4     0 Yes   
SCHEDULESHOUR                  SYSIBM    INTEGER                   4     0 Yes   
SCHEDULESDAY                   SYSIBM    INTEGER                   4     0 Yes   
SCHEDULESMONTH                 SYSIBM    INTEGER                   4     0 Yes   
SCHEDULESYEAR                  SYSIBM    INTEGER                   4     0 Yes   
DESCRIPTION                    SYSIBM    VARCHAR                 100     0 Yes   
TMPLTYPE                       SYSIBM    INTEGER                   4     0 Yes   
BILLTYPE                       SYSIBM    INTEGER                   4     0 Yes   
EVENTTYPE                      SYSIBM    INTEGER                   4     0 Yes   
AMOUNT                         SYSIBM    INTEGER                   4     0 Yes   

  20 record(s) selected.


describe table EVWBILL.SCHEDULESSEARCH_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
LASTSEARCHUTC                  SYSIBM    INTEGER                   4     0 Yes   
LASTUSERCOSTSEARCHUTC          SYSIBM    INTEGER                   4     0 Yes   
DBVERSION                      SYSIBM    VARCHAR                  25     0 Yes   

  3 record(s) selected.


describe table EVWBILL.TAXREALM_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
TAXREALMID                     SYSIBM    INTEGER                   4     0 No    
MERCHANTREALMID                SYSIBM    INTEGER                   4     0 No    
NAME                           SYSIBM    VARCHAR                  20     0 No    
DESCRIPTION                    SYSIBM    VARCHAR                 100     0 Yes   

  4 record(s) selected.


describe table EVWBILL.TAXREALMDETAILS_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
TAXREALMDETAILSID              SYSIBM    INTEGER                   4     0 No    
REALMID                        SYSIBM    INTEGER                   4     0 No    
TAXSTRUCTUREID                 SYSIBM    INTEGER                   4     0 No    

  3 record(s) selected.


describe table EVWBILL.TAXSTRUCTURES_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
TAXSTRUCTUREID                 SYSIBM    INTEGER                   4     0 No    
MERCHANTREALMID                SYSIBM    INTEGER                   4     0 No    
NAME                           SYSIBM    VARCHAR                  20     0 No    
DESCRIPTION                    SYSIBM    VARCHAR                 100     0 Yes   
TAXRATE                        SYSIBM    DOUBLE                    8     0 Yes   

  5 record(s) selected.


describe table EVWBILL.TAXTEMPLATE_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
TAXTEMPLATEID                  SYSIBM    INTEGER                   4     0 No    
TEMPLATEID                     SYSIBM    INTEGER                   4     0 Yes   
TAXID                          SYSIBM    INTEGER                   4     0 Yes   

  3 record(s) selected.


describe table EVWBILL.WEBTRAFFICAUDIT

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ACCOUNTID                      SYSIBM    INTEGER                   4     0 Yes   
AMOUNT                         SYSIBM    INTEGER                   4     0 Yes   
BEGINUTC                       SYSIBM    INTEGER                   4     0 Yes   
ENDUTC                         SYSIBM    INTEGER                   4     0 Yes   
INSTALLEDID                    SYSIBM    VARCHAR                 255     0 Yes   
DOMAIN                         SYSIBM    VARCHAR                 255     0 Yes   
ORGANIZATION                   SYSIBM    VARCHAR                 255     0 Yes   

  7 record(s) selected.


describe table EVWPROD.CHECKATTRIBUTES_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
CHECKID                        SYSIBM    INTEGER                   4     0 No    
PROFILENAME                    SYSIBM    VARCHAR                  50     0 No    
ATTRIBUTE                      SYSIBM    VARCHAR                  40     0 No    
ATTRIBUTEVALUE                 SYSIBM    VARCHAR                  60     0 No    

  4 record(s) selected.


describe table EVWPROD.COSTPROFILE

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
COSTPROFILEID                  SYSIBM    VARCHAR                  30     0 No    
PRODUCTMERCHANTID              SYSIBM    INTEGER                   4     0 No    
PRODUCTID                      SYSIBM    VARCHAR                  30     0 Yes   
NAME                           SYSIBM    VARCHAR                 100     0 No    
DESCRIPTION                    SYSIBM    VARCHAR                 255     0 No    
USAGE                          SYSIBM    INTEGER                   4     0 No    

  6 record(s) selected.


describe table EVWPROD.COSTPROFILECOMPONENT

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
COSTPROFILECOMPONENTID         SYSIBM    INTEGER                   4     0 No    
COSTPROFILEID                  SYSIBM    VARCHAR                  30     0 No    
HOURFROM                       SYSIBM    INTEGER                   4     0 No    
DAYFROM                        SYSIBM    INTEGER                   4     0 No    
MONTHFROM                      SYSIBM    INTEGER                   4     0 No    
YEARFROM                       SYSIBM    INTEGER                   4     0 No    
HOURTO                         SYSIBM    INTEGER                   4     0 No    
DAYTO                          SYSIBM    INTEGER                   4     0 No    
MONTHTO                        SYSIBM    INTEGER                   4     0 No    
YEARTO                         SYSIBM    INTEGER                   4     0 No    
ENTRYTYPE                      SYSIBM    INTEGER                   4     0 No    
BILLINGTYPE                    SYSIBM    INTEGER                   4     0 No    
COMPONENTTYPE                  SYSIBM    INTEGER                   4     0 No    
AMOUNT                         SYSIBM    INTEGER                   4     0 No    
FACTOR                         SYSIBM    DOUBLE                    8     0 No    
BILLINGACTIONID                SYSIBM    VARCHAR                  60     0 No    
NAME                           SYSIBM    VARCHAR                 100     0 No    
DESCRIPTION                    SYSIBM    VARCHAR                 255     0 No    
DATA                           SYSIBM    VARCHAR                 255     0 No    
BILLINGID                      SYSIBM    INTEGER                   4     0 No    
TAXIDS                         SYSIBM    VARCHAR                 150     0 No    

  21 record(s) selected.


describe table EVWPROD.DIALUPPROFILE_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
PROFILENAME                    SYSIBM    VARCHAR                 100     0 No    
PROFILEVALUE                   SYSIBM    VARCHAR                 100     0 No    

  2 record(s) selected.


describe table EVWPROD.DIALUPPROFILES_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
NAME                           SYSIBM    VARCHAR                  50     0 No    
REFCOUNT                       SYSIBM    INTEGER                   4     0 No    

  2 record(s) selected.


describe table EVWPROD.DIALUPTIMES_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
DIALUPTIMESID                  SYSIBM    INTEGER                   4     0 No    
PROFILENAME                    SYSIBM    VARCHAR                  50     0 No    
STARTDAY                       SYSIBM    INTEGER                   4     0 No    
STARTHOUR                      SYSIBM    INTEGER                   4     0 No    
STARTMIN                       SYSIBM    INTEGER                   4     0 No    
ENDDAY                         SYSIBM    INTEGER                   4     0 No    
ENDHOUR                        SYSIBM    INTEGER                   4     0 No    
ENDMIN                         SYSIBM    INTEGER                   4     0 No    

  8 record(s) selected.


describe table EVWPROD.DOMAINCOSTLIST_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ID                             SYSIBM    VARCHAR                 100     0 No    
BLOBPTR                        SYSIBM    BLOB                2097152     0 Yes   

  2 record(s) selected.


describe table EVWPROD.DOMAINEXPIRING

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
FQDN                           SYSIBM    VARCHAR                 100     0 No    
ORGDN                          SYSIBM    VARCHAR                 100     0 No    
EXPIRYDATE                     SYSIBM    TIMESTAMP                10     0 No    

  3 record(s) selected.


describe table EVWPROD.DOMAINHISTORY

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
HISTORYID                      SYSIBM    INTEGER                   4     0 No    
FQDN                           SYSIBM    VARCHAR                 100     0 No    
ORGDN                          SYSIBM    VARCHAR                 100     0 No    
PERIOD                         SYSIBM    INTEGER                   4     0 No    
EXPIRYDATE                     SYSIBM    TIMESTAMP                10     0 No    
PREVIOUSEXPIRYDATE             SYSIBM    TIMESTAMP                10     0 Yes   
RENEWEDDATE                    SYSIBM    TIMESTAMP                10     0 Yes   
SPLASHID                       SYSIBM    INTEGER                   4     0 Yes   
WIZARDID                       SYSIBM    INTEGER                   4     0 Yes   
RENEWCOUNT                     SYSIBM    INTEGER                   4     0 No    
INITIALDATE                    SYSIBM    TIMESTAMP                10     0 No    
INSTALLEDPRODUCTID             SYSIBM    VARCHAR                 100     0 No    
MAILDATE                       SYSIBM    TIMESTAMP                10     0 Yes   
VISPDN                         SYSIBM    VARCHAR                 200     0 Yes   

  14 record(s) selected.


describe table EVWPROD.DOMAINHISTORY_A

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
FQDN                           SYSIBM    VARCHAR                 100     0 No    
ARCHIVEDATE                    SYSIBM    TIMESTAMP                10     0 No    
ORGDN                          SYSIBM    VARCHAR                 100     0 Yes   
PERIOD                         SYSIBM    INTEGER                   4     0 Yes   
EXPIRYDATE                     SYSIBM    TIMESTAMP                10     0 Yes   
PREVIOUSEXPIRYDATE             SYSIBM    TIMESTAMP                10     0 Yes   
MAILDATE                       SYSIBM    TIMESTAMP                10     0 Yes   
RENEWEDDATE                    SYSIBM    TIMESTAMP                10     0 Yes   
SPLASHID                       SYSIBM    INTEGER                   4     0 Yes   
WIZARDID                       SYSIBM    INTEGER                   4     0 Yes   
RENEWCOUNT                     SYSIBM    INTEGER                   4     0 Yes   
INITIALDATE                    SYSIBM    TIMESTAMP                10     0 Yes   
INSTALLEDPRODUCTID             SYSIBM    VARCHAR                 100     0 Yes   
VISPDN                         SYSIBM    VARCHAR                 200     0 Yes   

  14 record(s) selected.


describe table EVWPROD.DOMAINPERIODS_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
FQDN                           SYSIBM    VARCHAR                 100     0 No    
DOMAINPERIOD                   SYSIBM    INTEGER                   4     0 No    
DOMAINNEW                      SYSIBM    DOUBLE                    8     0 No    
DOMAINUPDATE                   SYSIBM    DOUBLE                    8     0 No    
DOMAINDELETION                 SYSIBM    DOUBLE                    8     0 No    
DOMAINRECURRING                SYSIBM    DOUBLE                    8     0 No    

  6 record(s) selected.


describe table EVWPROD.DOMAINVETTING

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
VETTINGID                      SYSIBM    INTEGER                   4     0 No    
TLD                            SYSIBM    VARCHAR                  20     0 No    
FQDN                           SYSIBM    VARCHAR                 255     0 No    
ACTION                         SYSIBM    VARCHAR                  20     0 No    
ORGNAME                        SYSIBM    VARCHAR                 100     0 No    
ORGDN                          SYSIBM    VARCHAR                 255     0 No    
ISPDN                          SYSIBM    VARCHAR                 255     0 No    
ENTRYDATE                      SYSIBM    TIMESTAMP                10     0 No    
VETTED                         SYSIBM    VARCHAR                   1     0 No    

  9 record(s) selected.


describe table EVWPROD.HARDWAREPROFILES_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ID                             SYSIBM    VARCHAR                 100     0 No    
BLOBPTR                        SYSIBM    BLOB                2097152     0 No    

  2 record(s) selected.


describe table EVWPROD.INSTALLEDCOSTPROFILES_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ID                             SYSIBM    VARCHAR                 100     0 No    
TOTALINSTALLED                 SYSIBM    INTEGER                   4     0 Yes   

  2 record(s) selected.


describe table EVWPROD.INSTALLEDPACKAGES

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ID                             SYSIBM    VARCHAR                 100     0 No    
ISPDN                          SYSIBM    VARCHAR                 250     0 No    
TOTALINSTALLED                 SYSIBM    INTEGER                   4     0 Yes   

  3 record(s) selected.


describe table EVWPROD.INSTALLEDPRODUCTS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ID                             SYSIBM    VARCHAR                 100     0 No    
ISPDN                          SYSIBM    VARCHAR                 250     0 No    
TOTALINSTALLED                 SYSIBM    INTEGER                   4     0 Yes   

  3 record(s) selected.


describe table EVWPROD.LDAPATTRIBUTES_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
LDAPID                         SYSIBM    INTEGER                   4     0 No    
PROFILENAME                    SYSIBM    VARCHAR                  50     0 No    
ATTRIBUTE                      SYSIBM    VARCHAR                  40     0 No    
ATTRIBUTEVALUE                 SYSIBM    VARCHAR                  60     0 No    

  4 record(s) selected.


describe table EVWPROD.MERCHANTS_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
PRODUCTMERCHANTID              SYSIBM    INTEGER                   4     0 No    
MERCHANTDN                     SYSIBM    VARCHAR                 100     0 No    
MERCHANTSTATE                  SYSIBM    VARCHAR                 100     0 No    
MERCHANTTYPE                   SYSIBM    VARCHAR                   8     0 No    

  4 record(s) selected.


describe table EVWPROD.MIVALICENSE_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
MIVAID                         SYSIBM    INTEGER                   4     0 No    
MIVALICENSE                    SYSIBM    VARCHAR                  20     0 No    
USED                           SYSIBM    VARCHAR                  10     0 No    
FQDN                           SYSIBM    VARCHAR                 255     0 No    
ORGDN                          SYSIBM    VARCHAR                 255     0 No    

  5 record(s) selected.


describe table EVWPROD.PACKAGEACTIONS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ACTIONID                       SYSIBM    INTEGER                   4     0 No    
ACTIONTIME                     SYSIBM    INTEGER                   4     0 No    
EVWPACKAGEID                   SYSIBM    VARCHAR                  25     0 No    
PRODUCTID                      SYSIBM    VARCHAR                  25     0 No    
PACKAGEACTION                  SYSIBM    VARCHAR                  50     0 No    
PURCHASERDN                    SYSIBM    VARCHAR                 250     0 No    
ORGANISATIONDN                 SYSIBM    VARCHAR                 250     0 No    
ISPDN                          SYSIBM    VARCHAR                 250     0 No    

  8 record(s) selected.


describe table EVWPROD.PRODUCTCATEGORY_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ID                             SYSIBM    VARCHAR                 100     0 No    
BLOBPTR                        SYSIBM    BLOB                2097152     0 No    

  2 record(s) selected.


describe table EVWPROD.PROFILEDATA_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
DATAID                         SYSIBM    INTEGER                   4     0 No    
PROFILENAME                    SYSIBM    VARCHAR                 100     0 No    
FIELDNAME                      SYSIBM    VARCHAR                  40     0 No    
FIELDDESCRIPTION               SYSIBM    VARCHAR                  70     0 No    
FIELDTYPE                      SYSIBM    VARCHAR                  20     0 No    
FIELDVALUES                    SYSIBM    VARCHAR                 255     0 No    

  6 record(s) selected.


describe table EVWPROD.QUOTAENTRIES_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
QUOTAID                        SYSIBM    INTEGER                   4     0 No    
PATH                           SYSIBM    VARCHAR                 200     0 No    
SERVERDN                       SYSIBM    VARCHAR                 200     0 No    
QUOTAASSIGNEDINKB              SYSIBM    INTEGER                   4     0 Yes   
QUOTAUSEDINKB                  SYSIBM    INTEGER                   4     0 Yes   
QUOTATYPE                      SYSIBM    INTEGER                   4     0 Yes   
USERNAME                       SYSIBM    VARCHAR                 200     0 No    
ORGANISATIONDN                 SYSIBM    VARCHAR                 200     0 No    
FQDN                           SYSIBM    VARCHAR                 200     0 Yes   

  9 record(s) selected.


describe table EVWPROD.REALM_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
REALM                          SYSIBM    VARCHAR                 100     0 No    
REFCOUNT                       SYSIBM    INTEGER                   4     0 No    

  2 record(s) selected.


describe table EVWPROD.REPLYATTRIBUTES_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
REPLYID                        SYSIBM    INTEGER                   4     0 No    
PROFILENAME                    SYSIBM    VARCHAR                  50     0 No    
ATTRIBUTE                      SYSIBM    VARCHAR                  40     0 No    
ATTRIBUTEVALUE                 SYSIBM    VARCHAR                  60     0 No    

  4 record(s) selected.


describe table EVWPROD.SCRIPTPROFILE_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
NAME                           SYSIBM    VARCHAR                 100     0 No    
USAGECOUNT                     SYSIBM    INTEGER                   4     0 No    
WIZARDPAGETYPE                 SYSIBM    VARCHAR                  20     0 No    
WIZARDPAGEPATH                 SYSIBM    VARCHAR                 150     0 No    
WIZARDSTEPNAME                 SYSIBM    VARCHAR                  30     0 No    
WIZARDSTEPDESCRIPTION          SYSIBM    VARCHAR                  70     0 No    
DISPLAYTREENODE                SYSIBM    VARCHAR                   5     0 No    
TREENODENAME                   SYSIBM    VARCHAR                  20     0 No    
TREENODEDESCRIPTION            SYSIBM    VARCHAR                  50     0 No    
TREENODECLICKABLE              SYSIBM    VARCHAR                   5     0 No    
TREENODEGROUPING               SYSIBM    VARCHAR                  30     0 No    
TREENODEGROUPNODE              SYSIBM    VARCHAR                  30     0 No    
TREENODEGROUPNODEDESCRIPTION   SYSIBM    VARCHAR                  50     0 No    
TREENODEGROUPNODEICONPATH      SYSIBM    VARCHAR                 150     0 No    
TREENODEICONPATH               SYSIBM    VARCHAR                 150     0 No    
TREENODEPAGEPATH               SYSIBM    VARCHAR                 150     0 No    
EMAILONINSTALL                 SYSIBM    VARCHAR                   5     0 No    
INSTALLAWAITRESPONCE           SYSIBM    VARCHAR                   5     0 No    
INSTALLEMAILADDRESS            SYSIBM    VARCHAR                 100     0 No    
INSTALLEMAILSUBJECT            SYSIBM    VARCHAR                 100     0 No    
INSTALLEMAILBODY               SYSIBM    BLOB                 262144     0 Yes   
EMAILONUNINSTALL               SYSIBM    VARCHAR                   5     0 No    
UNINSTALLAWAITRESPONCE         SYSIBM    VARCHAR                   5     0 No    
UNINSTALLEMAILADDRESS          SYSIBM    VARCHAR                 100     0 No    
UNINSTALLEMAILSUBJECT          SYSIBM    VARCHAR                 100     0 No    
UNINSTALLEMAILBODY             SYSIBM    BLOB                 262144     0 Yes   

  26 record(s) selected.


describe table EVWPROD.UPGRADETARGET_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
PACKAGEID                      SYSIBM    VARCHAR                 100     0 No    
UPGRADETARGETS                 SYSIBM    VARCHAR                1000     0 Yes   

  2 record(s) selected.


describe table EVWPROD.VISPASSIGNEDPACKAGE_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
PACKAGEID                      SYSIBM    VARCHAR                  30     0 No    
PRODUCTMERCHANTID              SYSIBM    INTEGER                   4     0 No    

  2 record(s) selected.


describe table EVWPROD.VISPCLONEDPACKAGE_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
CLONEDPACKAGEID                SYSIBM    VARCHAR                  30     0 No    
PACKAGEID                      SYSIBM    VARCHAR                  30     0 No    
PRODUCTMERCHANTID              SYSIBM    INTEGER                   4     0 No    

  3 record(s) selected.


describe table EVWPROD.VISPREALM

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
VISPDN                         SYSIBM    VARCHAR                 255     0 No    
REALMNAME                      SYSIBM    VARCHAR                 100     0 No    

  2 record(s) selected.


describe table EVWPROD.WEBTRAFFICSCALES_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ID                             SYSIBM    VARCHAR                 100     0 No    
BLOBPTR                        SYSIBM    BLOB                2097152     0 Yes   

  2 record(s) selected.


describe table EVWSYS.ACTIVITYSNAPSHOT

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
TIMESTAMP                      SYSIBM    INTEGER                   4     0 Yes   
PRODUCTID                      SYSIBM    VARCHAR                 100     0 No    
ISPDN                          SYSIBM    VARCHAR                 254     0 Yes   
QUANTITY                       SYSIBM    INTEGER                   4     0 Yes   

  4 record(s) selected.


describe table EVWSYS.CONTACTS_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
CONTACTID                      SYSIBM    INTEGER                   4     0 No    
OWNERADDR1                     SYSIBM    VARCHAR                 100     0 Yes   
OWNERADDR2                     SYSIBM    VARCHAR                 100     0 Yes   
OWNERADDR3                     SYSIBM    VARCHAR                 100     0 Yes   
OWNERCITY                      SYSIBM    VARCHAR                 100     0 Yes   
OWNERCOUNTRY                   SYSIBM    VARCHAR                 100     0 Yes   
OWNEREMAIL                     SYSIBM    VARCHAR                 100     0 Yes   
OWNERFAX                       SYSIBM    VARCHAR                  50     0 Yes   
OWNERFIRSTNAME                 SYSIBM    VARCHAR                  50     0 Yes   
OWNERLASTNAME                  SYSIBM    VARCHAR                  50     0 Yes   
OWNERORGNAME                   SYSIBM    VARCHAR                  50     0 Yes   
OWNERPHONE                     SYSIBM    VARCHAR                  50     0 Yes   
OWNERPOSTALCODE                SYSIBM    VARCHAR                  50     0 Yes   
OWNERSTATE                     SYSIBM    VARCHAR                  50     0 Yes   
OWNERURL                       SYSIBM    VARCHAR                  50     0 Yes   
ADMINADDR1                     SYSIBM    VARCHAR                 100     0 Yes   
ADMINADDR2                     SYSIBM    VARCHAR                 100     0 Yes   
ADMINADDR3                     SYSIBM    VARCHAR                 100     0 Yes   
ADMINCITY                      SYSIBM    VARCHAR                 100     0 Yes   
ADMINCOUNTRY                   SYSIBM    VARCHAR                 100     0 Yes   
ADMINEMAIL                     SYSIBM    VARCHAR                 100     0 Yes   
ADMINFAX                       SYSIBM    VARCHAR                  50     0 Yes   
ADMINFIRSTNAME                 SYSIBM    VARCHAR                  50     0 Yes   
ADMINLASTNAME                  SYSIBM    VARCHAR                  50     0 Yes   
ADMINORGNAME                   SYSIBM    VARCHAR                  50     0 Yes   
ADMINPHONE                     SYSIBM    VARCHAR                  50     0 Yes   
ADMINPOSTALCODE                SYSIBM    VARCHAR                  50     0 Yes   
ADMINSTATE                     SYSIBM    VARCHAR                  50     0 Yes   
ADMINURL                       SYSIBM    VARCHAR                  50     0 Yes   
BILLINGADDR1                   SYSIBM    VARCHAR                 100     0 Yes   
BILLINGADDR2                   SYSIBM    VARCHAR                 100     0 Yes   
BILLINGADDR3                   SYSIBM    VARCHAR                 100     0 Yes   
BILLINGCITY                    SYSIBM    VARCHAR                 100     0 Yes   
BILLINGCOUNTRY                 SYSIBM    VARCHAR                 100     0 Yes   
BILLINGEMAIL                   SYSIBM    VARCHAR                 100     0 Yes   
BILLINGFAX                     SYSIBM    VARCHAR                  50     0 Yes   
BILLINGFIRSTNAME               SYSIBM    VARCHAR                  50     0 Yes   
BILLINGLASTNAME                SYSIBM    VARCHAR                  50     0 Yes   
BILLINGORGNAME                 SYSIBM    VARCHAR                  50     0 Yes   
BILLINGPHONE                   SYSIBM    VARCHAR                  50     0 Yes   
BILLINGPOSTALCODE              SYSIBM    VARCHAR                  50     0 Yes   
BILLINGSTATE                   SYSIBM    VARCHAR                  50     0 Yes   
BILLINGURL                     SYSIBM    VARCHAR                  50     0 Yes   
TECHADDR1                      SYSIBM    VARCHAR                 100     0 Yes   
TECHADDR2                      SYSIBM    VARCHAR                 100     0 Yes   
TECHADDR3                      SYSIBM    VARCHAR                 100     0 Yes   
TECHCITY                       SYSIBM    VARCHAR                 100     0 Yes   
TECHCOUNTRY                    SYSIBM    VARCHAR                 100     0 Yes   
TECHEMAIL                      SYSIBM    VARCHAR                 100     0 Yes   
TECHFAX                        SYSIBM    VARCHAR                  50     0 Yes   
TECHFIRSTNAME                  SYSIBM    VARCHAR                  50     0 Yes   
TECHLASTNAME                   SYSIBM    VARCHAR                  50     0 Yes   
TECHORGNAME                    SYSIBM    VARCHAR                  50     0 Yes   
TECHPHONE                      SYSIBM    VARCHAR                  50     0 Yes   
TECHPOSTALCODE                 SYSIBM    VARCHAR                  50     0 Yes   
TECHSTATE                      SYSIBM    VARCHAR                  50     0 Yes   
TECHURL                        SYSIBM    VARCHAR                  50     0 Yes   

  57 record(s) selected.


describe table EVWSYS.DOMAINTRACKING_A

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
FQDN                           SYSIBM    VARCHAR                 100     0 No    
ARCHIVEDATE                    SYSIBM    TIMESTAMP                10     0 No    
DOMAINACTION                   SYSIBM    VARCHAR                  20     0 No    
REGUSERNAME                    SYSIBM    VARCHAR                  50     0 Yes   
REGPASSWORD                    SYSIBM    VARCHAR                  50     0 Yes   
DOMAINCOUNT                    SYSIBM    INTEGER                   4     0 Yes   
PERIOD                         SYSIBM    INTEGER                   4     0 Yes   
AUTORENEWAL                    SYSIBM    INTEGER                   4     0 Yes   
AUTHORIZED                     SYSIBM    VARCHAR                   1     0 No    
ORGDN                          SYSIBM    VARCHAR                 100     0 Yes   
COOKIE                         SYSIBM    VARCHAR                 255     0 Yes   
COOKIETIMESTAMPUTC             SYSIBM    INTEGER                   4     0 Yes   
FOUNDCONTACTINFO               SYSIBM    INTEGER                   4     0 Yes   
FOUNDREGNAMESERVERS            SYSIBM    INTEGER                   4     0 Yes   
FOUNDDOMAINNAMESERVERS         SYSIBM    INTEGER                   4     0 Yes   
TIMESTAMPUTC                   SYSIBM    INTEGER                   4     0 No    
DATEUTC                        SYSIBM    VARCHAR                  20     0 No    

  17 record(s) selected.


describe table EVWSYS.DOMAINTRACKING_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
DOMAINTRACKINGID               SYSIBM    INTEGER                   4     0 No    
FQDN                           SYSIBM    VARCHAR                 100     0 No    
DOMAINACTION                   SYSIBM    VARCHAR                  20     0 No    
REGUSERNAME                    SYSIBM    VARCHAR                  50     0 Yes   
REGPASSWORD                    SYSIBM    VARCHAR                  50     0 Yes   
DOMAINCOUNT                    SYSIBM    INTEGER                   4     0 Yes   
PERIOD                         SYSIBM    INTEGER                   4     0 Yes   
AUTORENEWAL                    SYSIBM    INTEGER                   4     0 Yes   
AUTHORIZED                     SYSIBM    VARCHAR                   1     0 No    
ORGDN                          SYSIBM    VARCHAR                 100     0 Yes   
COOKIE                         SYSIBM    VARCHAR                 255     0 Yes   
COOKIETIMESTAMPUTC             SYSIBM    INTEGER                   4     0 Yes   
FOUNDCONTACTINFO               SYSIBM    INTEGER                   4     0 Yes   
FOUNDREGNAMESERVERS            SYSIBM    INTEGER                   4     0 Yes   
FOUNDDOMAINNAMESERVERS         SYSIBM    INTEGER                   4     0 Yes   
TIMESTAMPUTC                   SYSIBM    INTEGER                   4     0 No    
DATEUTC                        SYSIBM    VARCHAR                  20     0 No    

  17 record(s) selected.


describe table EVWSYS.DOMNAMESERVERS_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
DOMNAMESERVERID                SYSIBM    INTEGER                   4     0 No    
DOMAINTRACKINGID               SYSIBM    INTEGER                   4     0 No    
NAMESERVER                     SYSIBM    VARCHAR                 100     0 Yes   
IPADDRESS                      SYSIBM    VARCHAR                 100     0 Yes   
SORTORDER                      SYSIBM    INTEGER                   4     0 Yes   

  5 record(s) selected.


describe table EVWSYS.FQDN_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
FQDN                           SYSIBM    VARCHAR                 100     0 No    
FQDNVALUE                      SYSIBM    VARCHAR                 100     0 Yes   

  2 record(s) selected.


describe table EVWSYS.JOBLOCK

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
JOBID                          SYSIBM    VARCHAR                  40     0 No    
DN                             SYSIBM    VARCHAR                 200     0 No    

  2 record(s) selected.


describe table EVWSYS.JOBS_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ID                             SYSIBM    VARCHAR                  40     0 No    
SCHEDULEDTIME                  SYSIBM    INTEGER                   4     0 Yes   
RETRIES                        SYSIBM    INTEGER                   4     0 Yes   
INSTALLTARGETDN                SYSIBM    VARCHAR                 512     0 No    
TARGET                         SYSIBM    VARCHAR                 512     0 No    
EXTENSION                      SYSIBM    VARCHAR                 512     0 Yes   
STATUS                         SYSIBM    INTEGER                   4     0 Yes   
BLOBPTR                        SYSIBM    BLOB                2097152     0 No    

  8 record(s) selected.


describe table EVWSYS.MAIL_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ID                             SYSIBM    VARCHAR                 100     0 No    
FQDN                           SYSIBM    VARCHAR                 100     0 No    
BLOBPTR                        SYSIBM    BLOB                 131072     0 No    

  3 record(s) selected.


describe table EVWSYS.MAILQUE_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
MAILID                         SYSIBM    INTEGER                   4     0 No    
DN                             SYSIBM    VARCHAR                 255     0 No    
EVWNAME                        SYSIBM    VARCHAR                  50     0 No    
EXTERNALREFERENCE              SYSIBM    VARCHAR                 100     0 No    
STATE                          SYSIBM    VARCHAR                  20     0 No    
MAILTYPE                       SYSIBM    VARCHAR                  20     0 No    
JOBID                          SYSIBM    VARCHAR                  30     0 No    
FROMADDRESS                    SYSIBM    VARCHAR                 100     0 No    
TOADDRESS                      SYSIBM    VARCHAR                 100     0 No    
SUBJECT                        SYSIBM    VARCHAR                 100     0 No    
MESSAGETXT                     SYSIBM    BLOB                 524288     0 Yes   
RETRYCOUNT                     SYSIBM    INTEGER                   4     0 No    
INSERTDATE                     SYSIBM    TIMESTAMP                10     0 No    
SENDDATE                       SYSIBM    TIMESTAMP                10     0 No    
COMPLETEDATE                   SYSIBM    TIMESTAMP                10     0 No    

  15 record(s) selected.


describe table EVWSYS.MAILQUEERROR_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ERRORID                        SYSIBM    INTEGER                   4     0 No    
MAILID                         SYSIBM    INTEGER                   4     0 No    
ERRORDATE                      SYSIBM    TIMESTAMP                10     0 Yes   
ERRORMESSAGE                   SYSIBM    VARCHAR                 255     0 No    

  4 record(s) selected.


describe table EVWSYS.MAILTEMPLATE

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
TEMPLATETYPE                   SYSIBM    VARCHAR                  50     0 No    
DN                             SYSIBM    VARCHAR                 255     0 No    
FROMADDRESS                    SYSIBM    VARCHAR                 255     0 No    
TOADDRESS                      SYSIBM    VARCHAR                 255     0 No    
SUBJECT                        SYSIBM    VARCHAR                 255     0 No    
BODY                           SYSIBM    BLOB                 524288     0 Yes   

  6 record(s) selected.


describe table EVWSYS.MAILTEMPLATEPARAMETER

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
TEMPLATETYPE                   SYSIBM    VARCHAR                  50     0 No    
NAME                           SYSIBM    VARCHAR                 100     0 No    
DESCRIPTION                    SYSIBM    VARCHAR                 255     0 No    

  3 record(s) selected.


describe table EVWSYS.MAILTEMPLATETYPE

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
TEMPLATETYPE                   SYSIBM    VARCHAR                  50     0 No    
NAME                           SYSIBM    VARCHAR                 255     0 No    
OWNER                          SYSIBM    VARCHAR                 255     0 No    
DESCRIPTION                    SYSIBM    VARCHAR                 255     0 No    
FROMADDRESS                    SYSIBM    VARCHAR                 255     0 No    
TOADDRESS                      SYSIBM    VARCHAR                 255     0 No    
SUBJECT                        SYSIBM    VARCHAR                 255     0 No    
FLAGS                          SYSIBM    VARCHAR                 100     0 Yes   
BODY                           SYSIBM    BLOB                 524288     0 Yes   

  9 record(s) selected.


describe table EVWSYS.MSGTEMPLATE_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
MSGID                          SYSIBM    VARCHAR                 255     0 No    
MSGNAME                        SYSIBM    VARCHAR                 255     0 No    
MSGDESC                        SYSIBM    VARCHAR                 255     0 No    
MSGFILENAME                    SYSIBM    VARCHAR                 255     0 No    

  4 record(s) selected.


describe table EVWSYS.PROCESSINGZONES

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ZONE                           SYSIBM    VARCHAR                 255     0 No    
ACTION                         SYSIBM    VARCHAR                 255     0 No    
JOBID                          SYSIBM    VARCHAR                  30     0 No    

  3 record(s) selected.


describe table EVWSYS.PRODUCT_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
PRODUCTID                      SYSIBM    VARCHAR                 100     0 No    
RUNNINGSHA                     SYSIBM    VARCHAR                  28     0 No    
BATCHID                        SYSIBM    INTEGER                   4     0 No    

  3 record(s) selected.


describe table EVWSYS.REGNAMESERVERS_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
REGNAMESERVERID                SYSIBM    INTEGER                   4     0 No    
DOMAINTRACKINGID               SYSIBM    INTEGER                   4     0 No    
NAMESERVER                     SYSIBM    VARCHAR                 100     0 Yes   
IPADDRESS                      SYSIBM    VARCHAR                 100     0 Yes   
CANDELETE                      SYSIBM    INTEGER                   4     0 Yes   

  5 record(s) selected.


describe table EVWSYS.RESOURCETABLE

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
RESOURCETYPE                   SYSIBM    INTEGER                   4     0 No    
RESOURCEID                     SYSIBM    VARCHAR                 100     0 No    
LANGUAGE                       SYSIBM    CHARACTER                 2     0 No    
COUNTRY                        SYSIBM    CHARACTER                 2     0 No    
RESOURCEDATA                   SYSIBM    VARCHAR                1024     0 No    

  5 record(s) selected.


describe table EVWSYS.SESSIONS_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ID                             SYSIBM    VARCHAR                 512     0 No    
BLOBPTR                        SYSIBM    BLOB                2097152     0 No    
IOR                            SYSIBM    VARCHAR                 512     0 No    
STATUS                         SYSIBM    INTEGER                   4     0 No    
STATUSTIME                     SYSIBM    INTEGER                   4     0 No    
CURRENTSTATUS                  SYSIBM    INTEGER                   4     0 No    
CURRENTSTATUSTIME              SYSIBM    INTEGER                   4     0 No    
CHECKTIME                      SYSIBM    INTEGER                   4     0 No    

  8 record(s) selected.


describe table EVWSYS.SPLASHMSG_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
SPLASHID                       SYSIBM    INTEGER                   4     0 No    
MSGID                          SYSIBM    VARCHAR                 255     0 No    
STARTDATE                      SYSIBM    TIMESTAMP                10     0 No    
ENDDATE                        SYSIBM    TIMESTAMP                10     0 No    
AUDIENCE                       SYSIBM    VARCHAR                 255     0 No    
MSGALERTTYPE                   SYSIBM    INTEGER                   4     0 No    

  6 record(s) selected.


describe table EVWSYS.TRANSACTION_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ID                             SYSIBM    INTEGER                   4     0 No    
TRANSACTIONTIMESTAMP           SYSIBM    INTEGER                   4     0 Yes   
PRODUCTID                      SYSIBM    VARCHAR                 100     0 No    
INSTALLEDPRODUCTID             SYSIBM    VARCHAR                 200     0 Yes   
INSTALLEDCOMPONENTID           SYSIBM    VARCHAR                 200     0 Yes   
PRODUCTDATA                    SYSIBM    VARCHAR                 254     0 Yes   
UNITTYPE                       SYSIBM    INTEGER                   4     0 Yes   
QUANTITY                       SYSIBM    INTEGER                   4     0 Yes   
UNITCOST                       SYSIBM    INTEGER                   4     0 Yes   
SHA                            SYSIBM    VARCHAR                  28     0 Yes   
BATCHID                        SYSIBM    INTEGER                   4     0 Yes   

  11 record(s) selected.


describe table EVWSYS.VIEWEDMSG_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
SPLASHID                       SYSIBM    INTEGER                   4     0 No    
USERDN                         SYSIBM    VARCHAR                 255     0 No    

  2 record(s) selected.


describe table EVWSYS.WHOISINFO_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
FQDN                           SYSIBM    VARCHAR                 100     0 No    
SERVERNAME                     SYSIBM    VARCHAR                 100     0 No    
SERVERCOMMENT                  SYSIBM    VARCHAR                 100     0 No    

  3 record(s) selected.


describe table EVWSYS.WIZLAUNCH_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
WIZID                          SYSIBM    INTEGER                   4     0 No    
WIZNAME                        SYSIBM    VARCHAR                  20     0 No    
STARTDATE                      SYSIBM    TIMESTAMP                10     0 No    
ENDDATE                        SYSIBM    TIMESTAMP                10     0 No    
AUDIENCE                       SYSIBM    VARCHAR                 255     0 No    

  5 record(s) selected.


describe table EVWSYS.ZONE_TBL

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
ZONE                           SYSIBM    VARCHAR                 100     0 No    
ZONEINFO                       SYSIBM    VARCHAR                 500     0 Yes   

  2 record(s) selected.


describe table SYSCAT.ATTRIBUTES

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
TYPESCHEMA                     SYSIBM    VARCHAR                 128     0 No    
TYPENAME                       SYSIBM    VARCHAR                  18     0 No    
ATTR_NAME                      SYSIBM    VARCHAR                  18     0 No    
ATTR_TYPESCHEMA                SYSIBM    VARCHAR                 128     0 No    
ATTR_TYPENAME                  SYSIBM    VARCHAR                  18     0 No    
TARGET_TYPESCHEMA              SYSIBM    VARCHAR                 128     0 Yes   
TARGET_TYPENAME                SYSIBM    VARCHAR                  18     0 Yes   
SOURCE_TYPESCHEMA              SYSIBM    VARCHAR                 128     0 No    
SOURCE_TYPENAME                SYSIBM    VARCHAR                  18     0 No    
ORDINAL                        SYSIBM    SMALLINT                  2     0 No    
LENGTH                         SYSIBM    INTEGER                   4     0 No    
SCALE                          SYSIBM    SMALLINT                  2     0 No    
CODEPAGE                       SYSIBM    SMALLINT                  2     0 No    
LOGGED                         SYSIBM    CHARACTER                 1     0 No    
COMPACT                        SYSIBM    CHARACTER                 1     0 No    
DL_FEATURES                    SYSIBM    CHARACTER                10     0 No    

  16 record(s) selected.


describe table SYSCAT.BUFFERPOOLNODES

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
BUFFERPOOLID                   SYSIBM    INTEGER                   4     0 No    
NODENUM                        SYSIBM    SMALLINT                  2     0 No    
NPAGES                         SYSIBM    INTEGER                   4     0 No    

  3 record(s) selected.


describe table SYSCAT.BUFFERPOOLS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
BPNAME                         SYSIBM    VARCHAR                  18     0 No    
BUFFERPOOLID                   SYSIBM    INTEGER                   4     0 No    
NGNAME                         SYSIBM    VARCHAR                  18     0 Yes   
NPAGES                         SYSIBM    INTEGER                   4     0 No    
PAGESIZE                       SYSIBM    INTEGER                   4     0 No    
ESTORE                         SYSIBM    CHARACTER                 1     0 No    

  6 record(s) selected.


describe table SYSCAT.CASTFUNCTIONS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
FROM_TYPESCHEMA                SYSIBM    VARCHAR                 128     0 No    
FROM_TYPENAME                  SYSIBM    VARCHAR                  18     0 No    
TO_TYPESCHEMA                  SYSIBM    VARCHAR                 128     0 No    
TO_TYPENAME                    SYSIBM    VARCHAR                  18     0 No    
FUNCSCHEMA                     SYSIBM    VARCHAR                 128     0 No    
FUNCNAME                       SYSIBM    VARCHAR                  18     0 No    
SPECIFICNAME                   SYSIBM    VARCHAR                  18     0 No    
ASSIGN_FUNCTION                SYSIBM    CHARACTER                 1     0 No    

  8 record(s) selected.


describe table SYSCAT.CHECKS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
CONSTNAME                      SYSIBM    VARCHAR                  18     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
TABSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
TABNAME                        SYSIBM    VARCHAR                 128     0 No    
CREATE_TIME                    SYSIBM    TIMESTAMP                10     0 No    
QUALIFIER                      SYSIBM    VARCHAR                 128     0 No    
TYPE                           SYSIBM    CHARACTER                 1     0 No    
FUNC_PATH                      SYSIBM    VARCHAR                 254     0 No    
TEXT                           SYSIBM    CLOB                  65536     0 No    

  9 record(s) selected.


describe table SYSCAT.COLAUTH

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
GRANTOR                        SYSIBM    VARCHAR                 128     0 No    
GRANTEE                        SYSIBM    VARCHAR                 128     0 No    
GRANTEETYPE                    SYSIBM    CHARACTER                 1     0 No    
TABSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
TABNAME                        SYSIBM    VARCHAR                 128     0 No    
COLNAME                        SYSIBM    VARCHAR                 128     0 No    
COLNO                          SYSIBM    SMALLINT                  2     0 No    
PRIVTYPE                       SYSIBM    CHARACTER                 1     0 No    
GRANTABLE                      SYSIBM    CHARACTER                 1     0 No    

  9 record(s) selected.


describe table SYSCAT.COLCHECKS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
CONSTNAME                      SYSIBM    VARCHAR                  18     0 No    
TABSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
TABNAME                        SYSIBM    VARCHAR                 128     0 No    
COLNAME                        SYSIBM    VARCHAR                 128     0 No    
USAGE                          SYSIBM    CHARACTER                 1     0 No    

  5 record(s) selected.


describe table SYSCAT.COLDIST

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
TABSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
TABNAME                        SYSIBM    VARCHAR                 128     0 No    
COLNAME                        SYSIBM    VARCHAR                 128     0 No    
TYPE                           SYSIBM    CHARACTER                 1     0 No    
SEQNO                          SYSIBM    SMALLINT                  2     0 No    
COLVALUE                       SYSIBM    VARCHAR                 254     0 Yes   
VALCOUNT                       SYSIBM    BIGINT                    8     0 No    
DISTCOUNT                      SYSIBM    BIGINT                    8     0 Yes   

  8 record(s) selected.


describe table SYSCAT.COLOPTIONS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
TABSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
TABNAME                        SYSIBM    VARCHAR                 128     0 No    
COLNAME                        SYSIBM    VARCHAR                 128     0 No    
OPTION                         SYSIBM    VARCHAR                 128     0 No    
SETTING                        SYSIBM    VARCHAR                 255     0 No    

  5 record(s) selected.


describe table SYSCAT.COLUMNS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
TABSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
TABNAME                        SYSIBM    VARCHAR                 128     0 No    
COLNAME                        SYSIBM    VARCHAR                 128     0 No    
COLNO                          SYSIBM    SMALLINT                  2     0 No    
TYPESCHEMA                     SYSIBM    VARCHAR                 128     0 No    
TYPENAME                       SYSIBM    VARCHAR                  18     0 No    
LENGTH                         SYSIBM    INTEGER                   4     0 No    
SCALE                          SYSIBM    SMALLINT                  2     0 No    
DEFAULT                        SYSIBM    VARCHAR                 254     0 Yes   
NULLS                          SYSIBM    CHARACTER                 1     0 No    
CODEPAGE                       SYSIBM    SMALLINT                  2     0 No    
LOGGED                         SYSIBM    CHARACTER                 1     0 No    
COMPACT                        SYSIBM    CHARACTER                 1     0 No    
COLCARD                        SYSIBM    BIGINT                    8     0 No    
HIGH2KEY                       SYSIBM    VARCHAR                 254     0 Yes   
LOW2KEY                        SYSIBM    VARCHAR                 254     0 Yes   
AVGCOLLEN                      SYSIBM    INTEGER                   4     0 No    
KEYSEQ                         SYSIBM    SMALLINT                  2     0 Yes   
PARTKEYSEQ                     SYSIBM    SMALLINT                  2     0 Yes   
NQUANTILES                     SYSIBM    SMALLINT                  2     0 No    
NMOSTFREQ                      SYSIBM    SMALLINT                  2     0 No    
NUMNULLS                       SYSIBM    BIGINT                    8     0 No    
TARGET_TYPESCHEMA              SYSIBM    VARCHAR                 128     0 Yes   
TARGET_TYPENAME                SYSIBM    VARCHAR                  18     0 Yes   
SCOPE_TABSCHEMA                SYSIBM    VARCHAR                 128     0 Yes   
SCOPE_TABNAME                  SYSIBM    VARCHAR                 128     0 Yes   
SOURCE_TABSCHEMA               SYSIBM    VARCHAR                 128     0 Yes   
SOURCE_TABNAME                 SYSIBM    VARCHAR                 128     0 Yes   
DL_FEATURES                    SYSIBM    CHARACTER                10     0 Yes   
SPECIAL_PROPS                  SYSIBM    CHARACTER                 8     0 Yes   
HIDDEN                         SYSIBM    CHARACTER                 1     0 No    
INLINE_LENGTH                  SYSIBM    INTEGER                   4     0 No    
IDENTITY                       SYSIBM    CHARACTER                 1     0 No    
GENERATED                      SYSIBM    CHARACTER                 1     0 No    
TEXT                           SYSIBM    CLOB                  65538     0 Yes   
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   

  36 record(s) selected.


describe table SYSCAT.CONSTDEP

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
CONSTNAME                      SYSIBM    VARCHAR                  18     0 No    
TABSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
TABNAME                        SYSIBM    VARCHAR                 128     0 No    
BTYPE                          SYSIBM    CHARACTER                 1     0 No    
BSCHEMA                        SYSIBM    VARCHAR                 128     0 No    
BNAME                          SYSIBM    VARCHAR                  18     0 No    

  6 record(s) selected.


describe table SYSCAT.DATATYPES

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
TYPESCHEMA                     SYSIBM    VARCHAR                 128     0 No    
TYPENAME                       SYSIBM    VARCHAR                  18     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
SOURCESCHEMA                   SYSIBM    VARCHAR                 128     0 Yes   
SOURCENAME                     SYSIBM    VARCHAR                  18     0 Yes   
METATYPE                       SYSIBM    CHARACTER                 1     0 No    
TYPEID                         SYSIBM    SMALLINT                  2     0 No    
SOURCETYPEID                   SYSIBM    SMALLINT                  2     0 Yes   
LENGTH                         SYSIBM    INTEGER                   4     0 No    
SCALE                          SYSIBM    SMALLINT                  2     0 No    
CODEPAGE                       SYSIBM    SMALLINT                  2     0 No    
CREATE_TIME                    SYSIBM    TIMESTAMP                10     0 No    
ATTRCOUNT                      SYSIBM    SMALLINT                  2     0 No    
INSTANTIABLE                   SYSIBM    CHARACTER                 1     0 No    
WITH_FUNC_ACCESS               SYSIBM    CHARACTER                 1     0 No    
FINAL                          SYSIBM    CHARACTER                 1     0 No    
INLINE_LENGTH                  SYSIBM    INTEGER                   4     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   

  18 record(s) selected.


describe table SYSCAT.DBAUTH

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
GRANTOR                        SYSIBM    VARCHAR                 128     0 No    
GRANTEE                        SYSIBM    VARCHAR                 128     0 No    
GRANTEETYPE                    SYSIBM    CHARACTER                 1     0 No    
DBADMAUTH                      SYSIBM    CHARACTER                 1     0 No    
CREATETABAUTH                  SYSIBM    CHARACTER                 1     0 No    
BINDADDAUTH                    SYSIBM    CHARACTER                 1     0 No    
CONNECTAUTH                    SYSIBM    CHARACTER                 1     0 No    
NOFENCEAUTH                    SYSIBM    CHARACTER                 1     0 No    
IMPLSCHEMAAUTH                 SYSIBM    CHARACTER                 1     0 No    
LOADAUTH                       SYSIBM    CHARACTER                 1     0 No    

  10 record(s) selected.


describe table SYSCAT.EVENTMONITORS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
EVMONNAME                      SYSIBM    VARCHAR                  18     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
TARGET_TYPE                    SYSIBM    CHARACTER                 1     0 No    
TARGET                         SYSIBM    VARCHAR                 246     0 No    
MAXFILES                       SYSIBM    INTEGER                   4     0 Yes   
MAXFILESIZE                    SYSIBM    INTEGER                   4     0 Yes   
BUFFERSIZE                     SYSIBM    INTEGER                   4     0 Yes   
IO_MODE                        SYSIBM    CHARACTER                 1     0 Yes   
WRITE_MODE                     SYSIBM    CHARACTER                 1     0 Yes   
AUTOSTART                      SYSIBM    CHARACTER                 1     0 No    
NODENUM                        SYSIBM    SMALLINT                  2     0 No    
MONSCOPE                       SYSIBM    CHARACTER                 1     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   

  13 record(s) selected.


describe table SYSCAT.EVENTS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
EVMONNAME                      SYSIBM    VARCHAR                  18     0 No    
TYPE                           SYSIBM    VARCHAR                  18     0 No    
FILTER                         SYSIBM    CLOB                  32768     0 Yes   

  3 record(s) selected.


describe table SYSCAT.FULLHIERARCHIES

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
METATYPE                       SYSIBM    CHARACTER                 1     0 No    
SUB_SCHEMA                     SYSIBM    VARCHAR                 128     0 Yes   
SUB_NAME                       SYSIBM    VARCHAR                 128     0 Yes   
SUPER_SCHEMA                   SYSIBM    VARCHAR                 128     0 Yes   
SUPER_NAME                     SYSIBM    VARCHAR                 128     0 Yes   
ROOT_SCHEMA                    SYSIBM    VARCHAR                 128     0 No    
ROOT_NAME                      SYSIBM    VARCHAR                 128     0 No    

  7 record(s) selected.


describe table SYSCAT.FUNCDEP

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
FUNCSCHEMA                     SYSIBM    VARCHAR                 128     0 No    
FUNCNAME                       SYSIBM    VARCHAR                  18     0 No    
BTYPE                          SYSIBM    CHARACTER                 1     0 No    
BSCHEMA                        SYSIBM    VARCHAR                 128     0 No    
BNAME                          SYSIBM    VARCHAR                 128     0 No    
TABAUTH                        SYSIBM    SMALLINT                  2     0 Yes   

  6 record(s) selected.


describe table SYSCAT.FUNCMAPOPTIONS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
FUNCTION_MAPPING               SYSIBM    VARCHAR                  18     0 No    
OPTION                         SYSIBM    VARCHAR                 128     0 No    
SETTING                        SYSIBM    VARCHAR                 255     0 No    

  3 record(s) selected.


describe table SYSCAT.FUNCMAPPARMOPTIONS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
FUNCTION_MAPPING               SYSIBM    VARCHAR                  18     0 No    
ORDINAL                        SYSIBM    SMALLINT                  2     0 No    
LOCATION                       SYSIBM    CHARACTER                 1     0 No    
OPTION                         SYSIBM    VARCHAR                 128     0 No    
SETTING                        SYSIBM    VARCHAR                 255     0 No    

  5 record(s) selected.


describe table SYSCAT.FUNCMAPPINGS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
FUNCTION_MAPPING               SYSIBM    VARCHAR                  18     0 No    
FUNCSCHEMA                     SYSIBM    VARCHAR                 128     0 Yes   
FUNCNAME                       SYSIBM    VARCHAR                1024     0 Yes   
FUNCID                         SYSIBM    INTEGER                   4     0 Yes   
SPECIFICNAME                   SYSIBM    VARCHAR                  18     0 Yes   
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
WRAPNAME                       SYSIBM    VARCHAR                 128     0 Yes   
SERVERNAME                     SYSIBM    VARCHAR                 128     0 Yes   
SERVERTYPE                     SYSIBM    VARCHAR                  30     0 Yes   
SERVERVERSION                  SYSIBM    VARCHAR                  18     0 Yes   
CREATE_TIME                    SYSIBM    TIMESTAMP                10     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   

  12 record(s) selected.


describe table SYSCAT.FUNCPARMS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
FUNCSCHEMA                     SYSIBM    VARCHAR                 128     0 No    
FUNCNAME                       SYSIBM    VARCHAR                  18     0 No    
SPECIFICNAME                   SYSIBM    VARCHAR                  18     0 No    
ROWTYPE                        SYSIBM    CHARACTER                 1     0 No    
ORDINAL                        SYSIBM    SMALLINT                  2     0 No    
PARMNAME                       SYSIBM    VARCHAR                 128     0 Yes   
TYPESCHEMA                     SYSIBM    VARCHAR                 128     0 No    
TYPENAME                       SYSIBM    VARCHAR                  18     0 No    
LENGTH                         SYSIBM    INTEGER                   4     0 No    
SCALE                          SYSIBM    SMALLINT                  2     0 No    
CODEPAGE                       SYSIBM    SMALLINT                  2     0 No    
CAST_FUNCID                    SYSIBM    INTEGER                   4     0 Yes   
AS_LOCATOR                     SYSIBM    CHARACTER                 1     0 No    
TARGET_TYPESCHEMA              SYSIBM    VARCHAR                 128     0 Yes   
TARGET_TYPENAME                SYSIBM    VARCHAR                  18     0 Yes   
SCOPE_TABSCHEMA                SYSIBM    VARCHAR                 128     0 Yes   
SCOPE_TABNAME                  SYSIBM    VARCHAR                 128     0 Yes   
TRANSFORM_GRPNAME              SYSIBM    VARCHAR                  18     0 Yes   

  18 record(s) selected.


describe table SYSCAT.FUNCTIONS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
FUNCSCHEMA                     SYSIBM    VARCHAR                 128     0 No    
FUNCNAME                       SYSIBM    VARCHAR                  18     0 No    
SPECIFICNAME                   SYSIBM    VARCHAR                  18     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
FUNCID                         SYSIBM    INTEGER                   4     0 No    
RETURN_TYPE                    SYSIBM    SMALLINT                  2     0 No    
ORIGIN                         SYSIBM    CHARACTER                 1     0 No    
TYPE                           SYSIBM    CHARACTER                 1     0 No    
METHOD                         SYSIBM    CHARACTER                 1     0 No    
EFFECT                         SYSIBM    CHARACTER                 2     0 No    
PARM_COUNT                     SYSIBM    SMALLINT                  2     0 No    
PARM_SIGNATURE                 SYSIBM    VARCHAR                 180     0 No    
CREATE_TIME                    SYSIBM    TIMESTAMP                10     0 No    
QUALIFIER                      SYSIBM    VARCHAR                 128     0 No    
WITH_FUNC_ACCESS               SYSIBM    CHARACTER                 1     0 No    
TYPE_PRESERVING                SYSIBM    CHARACTER                 1     0 No    
VARIANT                        SYSIBM    CHARACTER                 1     0 No    
SIDE_EFFECTS                   SYSIBM    CHARACTER                 1     0 No    
FENCED                         SYSIBM    CHARACTER                 1     0 No    
NULLCALL                       SYSIBM    CHARACTER                 1     0 No    
CAST_FUNCTION                  SYSIBM    CHARACTER                 1     0 No    
ASSIGN_FUNCTION                SYSIBM    CHARACTER                 1     0 No    
SCRATCHPAD                     SYSIBM    CHARACTER                 1     0 No    
FINAL_CALL                     SYSIBM    CHARACTER                 1     0 No    
PARALLELIZABLE                 SYSIBM    CHARACTER                 1     0 No    
CONTAINS_SQL                   SYSIBM    CHARACTER                 1     0 No    
DBINFO                         SYSIBM    CHARACTER                 1     0 No    
RESULT_COLS                    SYSIBM    SMALLINT                  2     0 No    
LANGUAGE                       SYSIBM    CHARACTER                 8     0 No    
IMPLEMENTATION                 SYSIBM    VARCHAR                 254     0 Yes   
CLASS                          SYSIBM    VARCHAR                 128     0 Yes   
JAR_ID                         SYSIBM    VARCHAR                 128     0 Yes   
PARM_STYLE                     SYSIBM    CHARACTER                 8     0 No    
SOURCE_SCHEMA                  SYSIBM    VARCHAR                 128     0 Yes   
SOURCE_SPECIFIC                SYSIBM    VARCHAR                  18     0 Yes   
IOS_PER_INVOC                  SYSIBM    DOUBLE                    8     0 No    
INSTS_PER_INVOC                SYSIBM    DOUBLE                    8     0 No    
IOS_PER_ARGBYTE                SYSIBM    DOUBLE                    8     0 No    
INSTS_PER_ARGBYTE              SYSIBM    DOUBLE                    8     0 No    
PERCENT_ARGBYTES               SYSIBM    SMALLINT                  2     0 No    
INITIAL_IOS                    SYSIBM    DOUBLE                    8     0 No    
INITIAL_INSTS                  SYSIBM    DOUBLE                    8     0 No    
CARDINALITY                    SYSIBM    BIGINT                    8     0 No    
IMPLEMENTED                    SYSIBM    CHARACTER                 1     0 No    
SELECTIVITY                    SYSIBM    DOUBLE                    8     0 No    
OVERRIDDEN_FUNCID              SYSIBM    INTEGER                   4     0 Yes   
SUBJECT_TYPESCHEMA             SYSIBM    VARCHAR                 128     0 Yes   
SUBJECT_TYPENAME               SYSIBM    VARCHAR                  18     0 Yes   
FUNC_PATH                      SYSIBM    VARCHAR                 254     0 Yes   
BODY                           SYSIBM    CLOB                1048576     0 Yes   
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   

  51 record(s) selected.


describe table SYSCAT.HIERARCHIES

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
METATYPE                       SYSIBM    CHARACTER                 1     0 No    
SUB_SCHEMA                     SYSIBM    VARCHAR                 128     0 No    
SUB_NAME                       SYSIBM    VARCHAR                 128     0 No    
SUPER_SCHEMA                   SYSIBM    VARCHAR                 128     0 No    
SUPER_NAME                     SYSIBM    VARCHAR                 128     0 No    
ROOT_SCHEMA                    SYSIBM    VARCHAR                 128     0 No    
ROOT_NAME                      SYSIBM    VARCHAR                 128     0 No    

  7 record(s) selected.


describe table SYSCAT.INDEXAUTH

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
GRANTOR                        SYSIBM    VARCHAR                 128     0 No    
GRANTEE                        SYSIBM    VARCHAR                 128     0 No    
GRANTEETYPE                    SYSIBM    CHARACTER                 1     0 No    
INDSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
INDNAME                        SYSIBM    VARCHAR                  18     0 No    
CONTROLAUTH                    SYSIBM    CHARACTER                 1     0 No    

  6 record(s) selected.


describe table SYSCAT.INDEXCOLUSE

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
INDSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
INDNAME                        SYSIBM    VARCHAR                  18     0 No    
COLNAME                        SYSIBM    VARCHAR                 128     0 No    
COLSEQ                         SYSIBM    SMALLINT                  2     0 No    
COLORDER                       SYSIBM    CHARACTER                 1     0 No    

  5 record(s) selected.


describe table SYSCAT.INDEXDEP

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
INDSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
INDNAME                        SYSIBM    VARCHAR                  18     0 No    
BTYPE                          SYSIBM    CHARACTER                 1     0 No    
BSCHEMA                        SYSIBM    VARCHAR                 128     0 No    
BNAME                          SYSIBM    VARCHAR                 128     0 No    
TABAUTH                        SYSIBM    SMALLINT                  2     0 Yes   

  6 record(s) selected.


describe table SYSCAT.INDEXES

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
INDSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
INDNAME                        SYSIBM    VARCHAR                  18     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
TABSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
TABNAME                        SYSIBM    VARCHAR                 128     0 No    
COLNAMES                       SYSIBM    VARCHAR                 640     0 No    
UNIQUERULE                     SYSIBM    CHARACTER                 1     0 No    
MADE_UNIQUE                    SYSIBM    CHARACTER                 1     0 No    
COLCOUNT                       SYSIBM    SMALLINT                  2     0 No    
UNIQUE_COLCOUNT                SYSIBM    SMALLINT                  2     0 No    
INDEXTYPE                      SYSIBM    CHARACTER                 4     0 No    
ENTRYTYPE                      SYSIBM    CHARACTER                 1     0 No    
PCTFREE                        SYSIBM    SMALLINT                  2     0 No    
IID                            SYSIBM    SMALLINT                  2     0 No    
NLEAF                          SYSIBM    INTEGER                   4     0 No    
NLEVELS                        SYSIBM    SMALLINT                  2     0 No    
FIRSTKEYCARD                   SYSIBM    BIGINT                    8     0 No    
FIRST2KEYCARD                  SYSIBM    BIGINT                    8     0 No    
FIRST3KEYCARD                  SYSIBM    BIGINT                    8     0 No    
FIRST4KEYCARD                  SYSIBM    BIGINT                    8     0 No    
FULLKEYCARD                    SYSIBM    BIGINT                    8     0 No    
CLUSTERRATIO                   SYSIBM    SMALLINT                  2     0 No    
CLUSTERFACTOR                  SYSIBM    DOUBLE                    8     0 No    
SEQUENTIAL_PAGES               SYSIBM    INTEGER                   4     0 No    
DENSITY                        SYSIBM    INTEGER                   4     0 No    
USER_DEFINED                   SYSIBM    SMALLINT                  2     0 No    
SYSTEM_REQUIRED                SYSIBM    SMALLINT                  2     0 No    
CREATE_TIME                    SYSIBM    TIMESTAMP                10     0 No    
STATS_TIME                     SYSIBM    TIMESTAMP                10     0 Yes   
PAGE_FETCH_PAIRS               SYSIBM    VARCHAR                 254     0 No    
MINPCTUSED                     SYSIBM    SMALLINT                  2     0 No    
REVERSE_SCANS                  SYSIBM    CHARACTER                 1     0 No    
INTERNAL_FORMAT                SYSIBM    SMALLINT                  2     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   

  34 record(s) selected.


describe table SYSCAT.INDEXOPTIONS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
INDSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
INDNAME                        SYSIBM    VARCHAR                  18     0 No    
OPTION                         SYSIBM    VARCHAR                 128     0 No    
SETTING                        SYSIBM    VARCHAR                 255     0 No    

  4 record(s) selected.


describe table SYSCAT.KEYCOLUSE

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
CONSTNAME                      SYSIBM    VARCHAR                  18     0 No    
TABSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
TABNAME                        SYSIBM    VARCHAR                 128     0 No    
COLNAME                        SYSIBM    VARCHAR                 128     0 No    
COLSEQ                         SYSIBM    SMALLINT                  2     0 No    

  5 record(s) selected.


describe table SYSCAT.NAMEMAPPINGS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
TYPE                           SYSIBM    CHARACTER                 1     0 No    
LOGICAL_SCHEMA                 SYSIBM    VARCHAR                 128     0 No    
LOGICAL_NAME                   SYSIBM    VARCHAR                 128     0 No    
LOGICAL_COLNAME                SYSIBM    VARCHAR                 128     0 Yes   
IMPL_SCHEMA                    SYSIBM    VARCHAR                 128     0 No    
IMPL_NAME                      SYSIBM    VARCHAR                 128     0 No    
IMPL_COLNAME                   SYSIBM    VARCHAR                 128     0 Yes   

  7 record(s) selected.


describe table SYSCAT.NODEGROUPDEF

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
NGNAME                         SYSIBM    VARCHAR                  18     0 No    
NODENUM                        SYSIBM    SMALLINT                  2     0 No    
IN_USE                         SYSIBM    CHARACTER                 1     0 No    

  3 record(s) selected.


describe table SYSCAT.NODEGROUPS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
NGNAME                         SYSIBM    VARCHAR                  18     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
PMAP_ID                        SYSIBM    SMALLINT                  2     0 No    
REBALANCE_PMAP_ID              SYSIBM    SMALLINT                  2     0 No    
CREATE_TIME                    SYSIBM    TIMESTAMP                10     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   

  6 record(s) selected.


describe table SYSCAT.PACKAGEAUTH

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
GRANTOR                        SYSIBM    VARCHAR                 128     0 No    
GRANTEE                        SYSIBM    VARCHAR                 128     0 No    
GRANTEETYPE                    SYSIBM    CHARACTER                 1     0 No    
PKGSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
PKGNAME                        SYSIBM    CHARACTER                 8     0 No    
CONTROLAUTH                    SYSIBM    CHARACTER                 1     0 No    
BINDAUTH                       SYSIBM    CHARACTER                 1     0 No    
EXECUTEAUTH                    SYSIBM    CHARACTER                 1     0 No    

  8 record(s) selected.


describe table SYSCAT.PACKAGEDEP

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
PKGSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
PKGNAME                        SYSIBM    CHARACTER                 8     0 No    
BINDER                         SYSIBM    VARCHAR                 128     0 Yes   
BTYPE                          SYSIBM    CHARACTER                 1     0 No    
BSCHEMA                        SYSIBM    VARCHAR                 128     0 No    
BNAME                          SYSIBM    VARCHAR                 128     0 No    
TABAUTH                        SYSIBM    SMALLINT                  2     0 Yes   

  7 record(s) selected.


describe table SYSCAT.PACKAGES

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
PKGSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
PKGNAME                        SYSIBM    CHARACTER                 8     0 No    
BOUNDBY                        SYSIBM    VARCHAR                 128     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
DEFAULT_SCHEMA                 SYSIBM    VARCHAR                 128     0 No    
VALID                          SYSIBM    CHARACTER                 1     0 No    
UNIQUE_ID                      SYSIBM    CHARACTER                 8     0 No    
TOTAL_SECT                     SYSIBM    SMALLINT                  2     0 No    
FORMAT                         SYSIBM    CHARACTER                 1     0 No    
ISOLATION                      SYSIBM    CHARACTER                 2     0 Yes   
BLOCKING                       SYSIBM    CHARACTER                 1     0 Yes   
INSERT_BUF                     SYSIBM    CHARACTER                 1     0 No    
LANG_LEVEL                     SYSIBM    CHARACTER                 1     0 Yes   
FUNC_PATH                      SYSIBM    VARCHAR                 254     0 No    
QUERYOPT                       SYSIBM    INTEGER                   4     0 No    
EXPLAIN_LEVEL                  SYSIBM    CHARACTER                 1     0 No    
EXPLAIN_MODE                   SYSIBM    CHARACTER                 1     0 No    
EXPLAIN_SNAPSHOT               SYSIBM    CHARACTER                 1     0 No    
SQLWARN                        SYSIBM    CHARACTER                 1     0 No    
SQLMATHWARN                    SYSIBM    CHARACTER                 1     0 No    
EXPLICIT_BIND_TIME             SYSIBM    TIMESTAMP                10     0 No    
LAST_BIND_TIME                 SYSIBM    TIMESTAMP                10     0 No    
CODEPAGE                       SYSIBM    SMALLINT                  2     0 No    
DEGREE                         SYSIBM    CHARACTER                 5     0 No    
MULTINODE_PLANS                SYSIBM    CHARACTER                 1     0 No    
INTRA_PARALLEL                 SYSIBM    CHARACTER                 1     0 No    
VALIDATE                       SYSIBM    CHARACTER                 1     0 No    
DYNAMICRULES                   SYSIBM    CHARACTER                 1     0 No    
SQLERROR                       SYSIBM    CHARACTER                 1     0 No    
REFRESHAGE                     SYSIBM    DECIMAL                  20     6 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   

  31 record(s) selected.


describe table SYSCAT.PARTITIONMAPS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
PMAP_ID                        SYSIBM    SMALLINT                  2     0 No    
PARTITIONMAP                   SYSIBM    LONG VARCHAR          32700     0 No    

  2 record(s) selected.


describe table SYSCAT.PASSTHRUAUTH

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
GRANTOR                        SYSIBM    VARCHAR                 128     0 No    
GRANTEE                        SYSIBM    VARCHAR                 128     0 No    
GRANTEETYPE                    SYSIBM    CHARACTER                 1     0 No    
SERVERNAME                     SYSIBM    VARCHAR                 128     0 No    

  4 record(s) selected.


describe table SYSCAT.PROCEDURES

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
PROCSCHEMA                     SYSIBM    VARCHAR                 128     0 No    
PROCNAME                       SYSIBM    VARCHAR                 128     0 No    
SPECIFICNAME                   SYSIBM    VARCHAR                  18     0 No    
PROCEDURE_ID                   SYSIBM    INTEGER                   4     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
PARM_COUNT                     SYSIBM    SMALLINT                  2     0 No    
PARM_SIGNATURE                 SYSIBM    VARCHAR                 180     0 No    
ORIGIN                         SYSIBM    CHARACTER                 1     0 No    
CREATE_TIME                    SYSIBM    TIMESTAMP                10     0 No    
DETERMINISTIC                  SYSIBM    CHARACTER                 1     0 No    
FENCED                         SYSIBM    CHARACTER                 1     0 No    
NULLCALL                       SYSIBM    CHARACTER                 1     0 No    
LANGUAGE                       SYSIBM    CHARACTER                 8     0 No    
IMPLEMENTATION                 SYSIBM    VARCHAR                 254     0 Yes   
CLASS                          SYSIBM    VARCHAR                 128     0 Yes   
JAR_ID                         SYSIBM    VARCHAR                 128     0 Yes   
PARM_STYLE                     SYSIBM    CHARACTER                 8     0 No    
CONTAINS_SQL                   SYSIBM    CHARACTER                 1     0 No    
DBINFO                         SYSIBM    CHARACTER                 1     0 No    
PROGRAM_TYPE                   SYSIBM    CHARACTER                 1     0 No    
RESULT_SETS                    SYSIBM    SMALLINT                  2     0 No    
VALID                          SYSIBM    CHARACTER                 1     0 No    
TEXT_BODY_OFFSET               SYSIBM    INTEGER                   4     0 No    
TEXT                           SYSIBM    CLOB                1048576     0 Yes   
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   

  25 record(s) selected.


describe table SYSCAT.PROCOPTIONS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
PROCSCHEMA                     SYSIBM    VARCHAR                 128     0 No    
PROCNAME                       SYSIBM    VARCHAR                 128     0 No    
OPTION                         SYSIBM    VARCHAR                 128     0 No    
SETTING                        SYSIBM    VARCHAR                 255     0 No    

  4 record(s) selected.


describe table SYSCAT.PROCPARMOPTIONS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
PROCSCHEMA                     SYSIBM    VARCHAR                 128     0 No    
PROCNAME                       SYSIBM    VARCHAR                 128     0 No    
ORDINAL                        SYSIBM    SMALLINT                  2     0 No    
OPTION                         SYSIBM    VARCHAR                 128     0 No    
SETTING                        SYSIBM    VARCHAR                 255     0 No    

  5 record(s) selected.


describe table SYSCAT.PROCPARMS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
PROCSCHEMA                     SYSIBM    VARCHAR                 128     0 No    
PROCNAME                       SYSIBM    VARCHAR                 128     0 No    
SPECIFICNAME                   SYSIBM    VARCHAR                  18     0 No    
SERVERNAME                     SYSIBM    VARCHAR                 128     0 Yes   
ORDINAL                        SYSIBM    SMALLINT                  2     0 No    
PARMNAME                       SYSIBM    VARCHAR                 128     0 No    
TYPESCHEMA                     SYSIBM    VARCHAR                 128     0 No    
TYPENAME                       SYSIBM    VARCHAR                  18     0 No    
TYPEID                         SYSIBM    SMALLINT                  2     0 Yes   
SOURCETYPEID                   SYSIBM    SMALLINT                  2     0 Yes   
NULLS                          SYSIBM    CHARACTER                 1     0 No    
LENGTH                         SYSIBM    INTEGER                   4     0 No    
SCALE                          SYSIBM    SMALLINT                  2     0 No    
PARM_MODE                      SYSIBM    VARCHAR                   5     0 No    
CODEPAGE                       SYSIBM    SMALLINT                  2     0 No    
DBCS_CODEPAGE                  SYSIBM    SMALLINT                  2     0 Yes   
AS_LOCATOR                     SYSIBM    CHARACTER                 1     0 No    
TARGET_TYPESCHEMA              SYSIBM    VARCHAR                 128     0 Yes   
TARGET_TYPENAME                SYSIBM    VARCHAR                  18     0 Yes   
SCOPE_TABSCHEMA                SYSIBM    VARCHAR                 128     0 Yes   
SCOPE_TABNAME                  SYSIBM    VARCHAR                 128     0 Yes   

  21 record(s) selected.


describe table SYSCAT.REFERENCES

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
CONSTNAME                      SYSIBM    VARCHAR                  18     0 No    
TABSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
TABNAME                        SYSIBM    VARCHAR                 128     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
REFKEYNAME                     SYSIBM    VARCHAR                  18     0 No    
REFTABSCHEMA                   SYSIBM    VARCHAR                 128     0 No    
REFTABNAME                     SYSIBM    VARCHAR                 128     0 No    
COLCOUNT                       SYSIBM    SMALLINT                  2     0 No    
DELETERULE                     SYSIBM    CHARACTER                 1     0 No    
UPDATERULE                     SYSIBM    CHARACTER                 1     0 No    
CREATE_TIME                    SYSIBM    TIMESTAMP                10     0 No    
FK_COLNAMES                    SYSIBM    VARCHAR                 640     0 No    
PK_COLNAMES                    SYSIBM    VARCHAR                 640     0 No    

  13 record(s) selected.


describe table SYSCAT.REVTYPEMAPPINGS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
TYPE_MAPPING                   SYSIBM    VARCHAR                  18     0 No    
TYPESCHEMA                     SYSIBM    VARCHAR                 128     0 Yes   
TYPENAME                       SYSIBM    VARCHAR                  18     0 No    
TYPEID                         SYSIBM    SMALLINT                  2     0 No    
SOURCETYPEID                   SYSIBM    SMALLINT                  2     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
LOWER_LEN                      SYSIBM    INTEGER                   4     0 Yes   
UPPER_LEN                      SYSIBM    INTEGER                   4     0 Yes   
LOWER_SCALE                    SYSIBM    SMALLINT                  2     0 Yes   
UPPER_SCALE                    SYSIBM    SMALLINT                  2     0 Yes   
S_OPR_P                        SYSIBM    CHARACTER                 2     0 Yes   
BIT_DATA                       SYSIBM    CHARACTER                 1     0 Yes   
WRAPNAME                       SYSIBM    VARCHAR                 128     0 Yes   
SERVERNAME                     SYSIBM    VARCHAR                 128     0 Yes   
SERVERTYPE                     SYSIBM    VARCHAR                  30     0 Yes   
SERVERVERSION                  SYSIBM    VARCHAR                  18     0 Yes   
REMOTE_TYPESCHEMA              SYSIBM    VARCHAR                 128     0 Yes   
REMOTE_TYPENAME                SYSIBM    VARCHAR                 128     0 No    
REMOTE_META_TYPE               SYSIBM    CHARACTER                 1     0 Yes   
REMOTE_LENGTH                  SYSIBM    INTEGER                   4     0 Yes   
REMOTE_SCALE                   SYSIBM    SMALLINT                  2     0 Yes   
REMOTE_BIT_DATA                SYSIBM    CHARACTER                 1     0 Yes   
USER_DEFINED                   SYSIBM    CHARACTER                 1     0 Yes   
CREATE_TIME                    SYSIBM    TIMESTAMP                10     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   

  25 record(s) selected.


describe table SYSCAT.SCHEMAAUTH

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
GRANTOR                        SYSIBM    VARCHAR                 128     0 No    
GRANTEE                        SYSIBM    VARCHAR                 128     0 No    
GRANTEETYPE                    SYSIBM    CHARACTER                 1     0 No    
SCHEMANAME                     SYSIBM    VARCHAR                 128     0 No    
ALTERINAUTH                    SYSIBM    CHARACTER                 1     0 No    
CREATEINAUTH                   SYSIBM    CHARACTER                 1     0 No    
DROPINAUTH                     SYSIBM    CHARACTER                 1     0 No    

  7 record(s) selected.


describe table SYSCAT.SCHEMATA

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
SCHEMANAME                     SYSIBM    VARCHAR                 128     0 No    
OWNER                          SYSIBM    VARCHAR                 128     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
CREATE_TIME                    SYSIBM    TIMESTAMP                10     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   

  5 record(s) selected.


describe table SYSCAT.SEQUENCES

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
SEQSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
SEQNAME                        SYSIBM    VARCHAR                 128     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 Yes   
OWNER                          SYSIBM    VARCHAR                 128     0 Yes   
SEQID                          SYSIBM    INTEGER                   4     0 No    
SEQTYPE                        SYSIBM    CHARACTER                 1     0 No    
INCREMENT                      SYSIBM    DECIMAL                  31     0 No    
START                          SYSIBM    DECIMAL                  31     0 Yes   
MAXVALUE                       SYSIBM    DECIMAL                  31     0 Yes   
MINVALUE                       SYSIBM    DECIMAL                  31     0 Yes   
CYCLE                          SYSIBM    CHARACTER                 1     0 No    
CACHE                          SYSIBM    SMALLINT                  2     0 No    
ORDER                          SYSIBM    CHARACTER                 1     0 No    
DATATYPEID                     SYSIBM    INTEGER                   4     0 No    
SOURCETYPEID                   SYSIBM    INTEGER                   4     0 Yes   
CREATE_TIME                    SYSIBM    TIMESTAMP                10     0 Yes   
ALTER_TIME                     SYSIBM    TIMESTAMP                10     0 Yes   
PRECISION                      SYSIBM    SMALLINT                  2     0 Yes   
ORIGIN                         SYSIBM    CHARACTER                 1     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   

  20 record(s) selected.


describe table SYSCAT.SERVEROPTIONS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
WRAPNAME                       SYSIBM    VARCHAR                 128     0 Yes   
SERVERNAME                     SYSIBM    VARCHAR                 128     0 Yes   
SERVERTYPE                     SYSIBM    VARCHAR                  30     0 Yes   
SERVERVERSION                  SYSIBM    VARCHAR                  18     0 Yes   
CREATE_TIME                    SYSIBM    TIMESTAMP                10     0 No    
OPTION                         SYSIBM    VARCHAR                 128     0 No    
SETTING                        SYSIBM    VARCHAR                2048     0 No    
SERVEROPTIONKEY                SYSIBM    VARCHAR                  18     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   

  9 record(s) selected.


describe table SYSCAT.SERVERS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
WRAPNAME                       SYSIBM    VARCHAR                 128     0 No    
SERVERNAME                     SYSIBM    VARCHAR                 128     0 No    
SERVERTYPE                     SYSIBM    VARCHAR                  30     0 Yes   
SERVERVERSION                  SYSIBM    VARCHAR                  18     0 Yes   
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   

  5 record(s) selected.


describe table SYSCAT.STATEMENTS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
PKGSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
PKGNAME                        SYSIBM    CHARACTER                 8     0 No    
STMTNO                         SYSIBM    INTEGER                   4     0 No    
SECTNO                         SYSIBM    SMALLINT                  2     0 No    
SEQNO                          SYSIBM    INTEGER                   4     0 No    
TEXT                           SYSIBM    CLOB                  65536     0 No    

  6 record(s) selected.


describe table SYSCAT.TABAUTH

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
GRANTOR                        SYSIBM    VARCHAR                 128     0 No    
GRANTEE                        SYSIBM    VARCHAR                 128     0 No    
GRANTEETYPE                    SYSIBM    CHARACTER                 1     0 No    
TABSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
TABNAME                        SYSIBM    VARCHAR                 128     0 No    
CONTROLAUTH                    SYSIBM    CHARACTER                 1     0 No    
ALTERAUTH                      SYSIBM    CHARACTER                 1     0 No    
DELETEAUTH                     SYSIBM    CHARACTER                 1     0 No    
INDEXAUTH                      SYSIBM    CHARACTER                 1     0 No    
INSERTAUTH                     SYSIBM    CHARACTER                 1     0 No    
SELECTAUTH                     SYSIBM    CHARACTER                 1     0 No    
REFAUTH                        SYSIBM    CHARACTER                 1     0 No    
UPDATEAUTH                     SYSIBM    CHARACTER                 1     0 No    

  13 record(s) selected.


describe table SYSCAT.TABCONST

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
CONSTNAME                      SYSIBM    VARCHAR                  18     0 No    
TABSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
TABNAME                        SYSIBM    VARCHAR                 128     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
TYPE                           SYSIBM    CHARACTER                 1     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   

  6 record(s) selected.


describe table SYSCAT.TABLES

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
TABSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
TABNAME                        SYSIBM    VARCHAR                 128     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
TYPE                           SYSIBM    CHARACTER                 1     0 No    
STATUS                         SYSIBM    CHARACTER                 1     0 No    
BASE_TABSCHEMA                 SYSIBM    VARCHAR                 128     0 Yes   
BASE_TABNAME                   SYSIBM    VARCHAR                 128     0 Yes   
ROWTYPESCHEMA                  SYSIBM    VARCHAR                 128     0 Yes   
ROWTYPENAME                    SYSIBM    VARCHAR                  18     0 Yes   
CREATE_TIME                    SYSIBM    TIMESTAMP                10     0 No    
STATS_TIME                     SYSIBM    TIMESTAMP                10     0 Yes   
COLCOUNT                       SYSIBM    SMALLINT                  2     0 No    
TABLEID                        SYSIBM    SMALLINT                  2     0 No    
TBSPACEID                      SYSIBM    SMALLINT                  2     0 No    
CARD                           SYSIBM    BIGINT                    8     0 No    
NPAGES                         SYSIBM    INTEGER                   4     0 No    
FPAGES                         SYSIBM    INTEGER                   4     0 No    
OVERFLOW                       SYSIBM    INTEGER                   4     0 No    
TBSPACE                        SYSIBM    VARCHAR                  18     0 Yes   
INDEX_TBSPACE                  SYSIBM    VARCHAR                  18     0 Yes   
LONG_TBSPACE                   SYSIBM    VARCHAR                  18     0 Yes   
PARENTS                        SYSIBM    SMALLINT                  2     0 Yes   
CHILDREN                       SYSIBM    SMALLINT                  2     0 Yes   
SELFREFS                       SYSIBM    SMALLINT                  2     0 Yes   
KEYCOLUMNS                     SYSIBM    SMALLINT                  2     0 Yes   
KEYINDEXID                     SYSIBM    SMALLINT                  2     0 Yes   
KEYUNIQUE                      SYSIBM    SMALLINT                  2     0 No    
CHECKCOUNT                     SYSIBM    SMALLINT                  2     0 No    
DATACAPTURE                    SYSIBM    CHARACTER                 1     0 No    
CONST_CHECKED                  SYSIBM    CHARACTER                32     0 No    
PMAP_ID                        SYSIBM    SMALLINT                  2     0 Yes   
PARTITION_MODE                 SYSIBM    CHARACTER                 1     0 No    
LOG_ATTRIBUTE                  SYSIBM    CHARACTER                 1     0 No    
PCTFREE                        SYSIBM    SMALLINT                  2     0 No    
APPEND_MODE                    SYSIBM    CHARACTER                 1     0 No    
REFRESH                        SYSIBM    CHARACTER                 1     0 No    
REFRESH_TIME                   SYSIBM    TIMESTAMP                10     0 Yes   
LOCKSIZE                       SYSIBM    CHARACTER                 1     0 No    
VOLATILE                       SYSIBM    CHARACTER                 1     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   

  40 record(s) selected.


describe table SYSCAT.TABLESPACES

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
TBSPACE                        SYSIBM    VARCHAR                  18     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
CREATE_TIME                    SYSIBM    TIMESTAMP                10     0 No    
TBSPACEID                      SYSIBM    INTEGER                   4     0 No    
TBSPACETYPE                    SYSIBM    CHARACTER                 1     0 No    
DATATYPE                       SYSIBM    CHARACTER                 1     0 No    
EXTENTSIZE                     SYSIBM    INTEGER                   4     0 No    
PREFETCHSIZE                   SYSIBM    INTEGER                   4     0 No    
OVERHEAD                       SYSIBM    DOUBLE                    8     0 No    
TRANSFERRATE                   SYSIBM    DOUBLE                    8     0 No    
PAGESIZE                       SYSIBM    INTEGER                   4     0 No    
NGNAME                         SYSIBM    VARCHAR                  18     0 No    
BUFFERPOOLID                   SYSIBM    INTEGER                   4     0 No    
DROP_RECOVERY                  SYSIBM    CHARACTER                 1     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   

  15 record(s) selected.


describe table SYSCAT.TABOPTIONS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
TABSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
TABNAME                        SYSIBM    VARCHAR                 128     0 No    
OPTION                         SYSIBM    VARCHAR                 128     0 No    
SETTING                        SYSIBM    VARCHAR                 255     0 No    

  4 record(s) selected.


describe table SYSCAT.TBSPACEAUTH

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
GRANTOR                        SYSIBM    VARCHAR                 128     0 No    
GRANTEE                        SYSIBM    VARCHAR                 128     0 No    
GRANTEETYPE                    SYSIBM    CHARACTER                 1     0 No    
TBSPACE                        SYSIBM    VARCHAR                  18     0 No    
USEAUTH                        SYSIBM    CHARACTER                 1     0 No    

  5 record(s) selected.


describe table SYSCAT.TRIGDEP

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
TRIGSCHEMA                     SYSIBM    VARCHAR                 128     0 No    
TRIGNAME                       SYSIBM    VARCHAR                  18     0 No    
BTYPE                          SYSIBM    CHARACTER                 1     0 No    
BSCHEMA                        SYSIBM    VARCHAR                 128     0 No    
BNAME                          SYSIBM    VARCHAR                 128     0 No    
TABAUTH                        SYSIBM    SMALLINT                  2     0 Yes   

  6 record(s) selected.


describe table SYSCAT.TRIGGERS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
TRIGSCHEMA                     SYSIBM    VARCHAR                 128     0 No    
TRIGNAME                       SYSIBM    VARCHAR                  18     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
TABSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
TABNAME                        SYSIBM    VARCHAR                 128     0 No    
TRIGTIME                       SYSIBM    CHARACTER                 1     0 No    
TRIGEVENT                      SYSIBM    CHARACTER                 1     0 No    
GRANULARITY                    SYSIBM    CHARACTER                 1     0 No    
VALID                          SYSIBM    CHARACTER                 1     0 No    
CREATE_TIME                    SYSIBM    TIMESTAMP                10     0 No    
QUALIFIER                      SYSIBM    VARCHAR                 128     0 No    
FUNC_PATH                      SYSIBM    VARCHAR                 254     0 No    
TEXT                           SYSIBM    CLOB                  65536     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   

  14 record(s) selected.


describe table SYSCAT.TYPEMAPPINGS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
TYPE_MAPPING                   SYSIBM    VARCHAR                  18     0 No    
TYPESCHEMA                     SYSIBM    VARCHAR                 128     0 Yes   
TYPENAME                       SYSIBM    VARCHAR                  18     0 No    
TYPEID                         SYSIBM    SMALLINT                  2     0 No    
SOURCETYPEID                   SYSIBM    SMALLINT                  2     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
LENGTH                         SYSIBM    INTEGER                   4     0 Yes   
SCALE                          SYSIBM    SMALLINT                  2     0 Yes   
BIT_DATA                       SYSIBM    CHARACTER                 1     0 Yes   
WRAPNAME                       SYSIBM    VARCHAR                 128     0 Yes   
SERVERNAME                     SYSIBM    VARCHAR                 128     0 Yes   
SERVERTYPE                     SYSIBM    VARCHAR                  30     0 Yes   
SERVERVERSION                  SYSIBM    VARCHAR                  18     0 Yes   
REMOTE_TYPESCHEMA              SYSIBM    VARCHAR                 128     0 Yes   
REMOTE_TYPENAME                SYSIBM    VARCHAR                 128     0 No    
REMOTE_META_TYPE               SYSIBM    CHARACTER                 1     0 Yes   
REMOTE_LOWER_LEN               SYSIBM    INTEGER                   4     0 Yes   
REMOTE_UPPER_LEN               SYSIBM    INTEGER                   4     0 Yes   
REMOTE_LOWER_SCALE             SYSIBM    SMALLINT                  2     0 Yes   
REMOTE_UPPER_SCALE             SYSIBM    SMALLINT                  2     0 Yes   
REMOTE_S_OPR_P                 SYSIBM    CHARACTER                 2     0 Yes   
REMOTE_BIT_DATA                SYSIBM    CHARACTER                 1     0 Yes   
USER_DEFINED                   SYSIBM    CHARACTER                 1     0 No    
CREATE_TIME                    SYSIBM    TIMESTAMP                10     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   

  25 record(s) selected.


describe table SYSCAT.USEROPTIONS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
AUTHID                         SYSIBM    VARCHAR                 128     0 No    
SERVERNAME                     SYSIBM    VARCHAR                 128     0 No    
OPTION                         SYSIBM    VARCHAR                 128     0 No    
SETTING                        SYSIBM    VARCHAR                 255     0 No    

  4 record(s) selected.


describe table SYSCAT.VIEWDEP

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
VIEWSCHEMA                     SYSIBM    VARCHAR                 128     0 No    
VIEWNAME                       SYSIBM    VARCHAR                 128     0 No    
DTYPE                          SYSIBM    CHARACTER                 1     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 Yes   
BTYPE                          SYSIBM    CHARACTER                 1     0 No    
BSCHEMA                        SYSIBM    VARCHAR                 128     0 No    
BNAME                          SYSIBM    VARCHAR                 128     0 No    
TABAUTH                        SYSIBM    SMALLINT                  2     0 Yes   

  8 record(s) selected.


describe table SYSCAT.VIEWS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
VIEWSCHEMA                     SYSIBM    VARCHAR                 128     0 No    
VIEWNAME                       SYSIBM    VARCHAR                 128     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
SEQNO                          SYSIBM    INTEGER                   4     0 No    
VIEWCHECK                      SYSIBM    CHARACTER                 1     0 No    
READONLY                       SYSIBM    CHARACTER                 1     0 No    
VALID                          SYSIBM    CHARACTER                 1     0 No    
QUALIFIER                      SYSIBM    VARCHAR                 128     0 No    
FUNC_PATH                      SYSIBM    VARCHAR                 254     0 No    
TEXT                           SYSIBM    CLOB                  65536     0 No    

  10 record(s) selected.


describe table SYSCAT.WRAPOPTIONS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
WRAPNAME                       SYSIBM    VARCHAR                 128     0 No    
OPTION                         SYSIBM    VARCHAR                 128     0 No    
SETTING                        SYSIBM    VARCHAR                 255     0 No    

  3 record(s) selected.


describe table SYSCAT.WRAPPERS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
WRAPNAME                       SYSIBM    VARCHAR                 128     0 No    
WRAPTYPE                       SYSIBM    CHARACTER                 1     0 No    
WRAPVERSION                    SYSIBM    INTEGER                   4     0 No    
LIBRARY                        SYSIBM    VARCHAR                 255     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   

  5 record(s) selected.


describe table SYSIBM.SYSATTRIBUTES

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
TYPESCHEMA                     SYSIBM    VARCHAR                 128     0 No    
TYPENAME                       SYSIBM    VARCHAR                  18     0 No    
ATTR_NAME                      SYSIBM    VARCHAR                  18     0 No    
ATTR_TYPESCHEMA                SYSIBM    VARCHAR                 128     0 No    
ATTR_TYPENAME                  SYSIBM    VARCHAR                  18     0 No    
ORDINAL                        SYSIBM    SMALLINT                  2     0 No    
LENGTH                         SYSIBM    INTEGER                   4     0 No    
SCALE                          SYSIBM    SMALLINT                  2     0 No    
UNUSED1                        SYSIBM    VARCHAR                 254     0 Yes   
UNUSED2                        SYSIBM    CHARACTER                 1     0 No    
CODEPAGE                       SYSIBM    SMALLINT                  2     0 No    
LOGGED                         SYSIBM    CHARACTER                 1     0 No    
COMPACT                        SYSIBM    CHARACTER                 1     0 No    
TARGET_TYPESCHEMA              SYSIBM    VARCHAR                 128     0 Yes   
TARGET_TYPENAME                SYSIBM    VARCHAR                  18     0 Yes   
DL_FEATURES                    SYSIBM    CHARACTER                10     0 No    
SOURCE_TYPESCHEMA              SYSIBM    VARCHAR                 128     0 No    
SOURCE_TYPENAME                SYSIBM    VARCHAR                  18     0 No    

  18 record(s) selected.


describe table SYSIBM.SYSBUFFERPOOLNODES

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
BUFFERPOOLID                   SYSIBM    INTEGER                   4     0 No    
NODENUM                        SYSIBM    SMALLINT                  2     0 No    
NPAGES                         SYSIBM    INTEGER                   4     0 No    

  3 record(s) selected.


describe table SYSIBM.SYSBUFFERPOOLS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
BPNAME                         SYSIBM    VARCHAR                  18     0 No    
BUFFERPOOLID                   SYSIBM    INTEGER                   4     0 No    
NGNAME                         SYSIBM    VARCHAR                  18     0 Yes   
NPAGES                         SYSIBM    INTEGER                   4     0 No    
PAGESIZE                       SYSIBM    INTEGER                   4     0 No    
ESTORE                         SYSIBM    CHARACTER                 1     0 No    

  6 record(s) selected.


describe table SYSIBM.SYSCHECKS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
NAME                           SYSIBM    VARCHAR                  18     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
TBNAME                         SYSIBM    VARCHAR                 128     0 No    
TBCREATOR                      SYSIBM    VARCHAR                 128     0 No    
CREATE_TIME                    SYSIBM    TIMESTAMP                10     0 No    
FUNC_PATH                      SYSIBM    VARCHAR                 254     0 No    
TEXT                           SYSIBM    CLOB                  65536     0 No    
QUALIFIER                      SYSIBM    VARCHAR                 128     0 No    
TYPE                           SYSIBM    CHARACTER                 1     0 No    

  9 record(s) selected.


describe table SYSIBM.SYSCOLAUTH

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
GRANTOR                        SYSIBM    VARCHAR                 128     0 No    
GRANTEE                        SYSIBM    VARCHAR                 128     0 No    
GRANTEETYPE                    SYSIBM    CHARACTER                 1     0 No    
CREATOR                        SYSIBM    VARCHAR                 128     0 No    
TNAME                          SYSIBM    VARCHAR                 128     0 No    
PRIVTYPE                       SYSIBM    CHARACTER                 1     0 No    
COLNAME                        SYSIBM    VARCHAR                 128     0 No    
GRANTABLE                      SYSIBM    CHARACTER                 1     0 No    
COLNO                          SYSIBM    SMALLINT                  2     0 No    

  9 record(s) selected.


describe table SYSIBM.SYSCOLCHECKS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
CONSTNAME                      SYSIBM    VARCHAR                  18     0 No    
TBNAME                         SYSIBM    VARCHAR                 128     0 No    
TBCREATOR                      SYSIBM    VARCHAR                 128     0 No    
COLNAME                        SYSIBM    VARCHAR                 128     0 No    
USAGE                          SYSIBM    CHARACTER                 1     0 No    

  5 record(s) selected.


describe table SYSIBM.SYSCOLDIST

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
NAME                           SYSIBM    VARCHAR                 128     0 No    
TBNAME                         SYSIBM    VARCHAR                 128     0 No    
SCHEMA                         SYSIBM    VARCHAR                 128     0 No    
TYPE                           SYSIBM    CHARACTER                 1     0 No    
SEQNO                          SYSIBM    SMALLINT                  2     0 No    
COLVALUE                       SYSIBM    VARCHAR                 254     0 Yes   
VALCOUNT                       SYSIBM    BIGINT                    8     0 No    
DISTCOUNT                      SYSIBM    BIGINT                    8     0 Yes   

  8 record(s) selected.


describe table SYSIBM.SYSCOLOPTIONS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
TABSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
TABNAME                        SYSIBM    VARCHAR                 128     0 No    
COLNAME                        SYSIBM    VARCHAR                 128     0 No    
OPTION                         SYSIBM    VARCHAR                 128     0 No    
SETTING                        SYSIBM    VARCHAR                 255     0 No    

  5 record(s) selected.


describe table SYSIBM.SYSCOLPROPERTIES

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
COLNAME                        SYSIBM    VARCHAR                 128     0 No    
TABNAME                        SYSIBM    VARCHAR                 128     0 No    
TABSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
TARGET_TYPESCHEMA              SYSIBM    VARCHAR                 128     0 Yes   
TARGET_TYPENAME                SYSIBM    VARCHAR                  18     0 Yes   
SCOPE_TABSCHEMA                SYSIBM    VARCHAR                 128     0 Yes   
SCOPE_TABNAME                  SYSIBM    VARCHAR                 128     0 Yes   
DL_FEATURES                    SYSIBM    CHARACTER                10     0 No    
SPECIAL_PROPS                  SYSIBM    CHARACTER                 8     0 No    

  9 record(s) selected.


describe table SYSIBM.SYSCOLUMNS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
NAME                           SYSIBM    VARCHAR                 128     0 No    
TBNAME                         SYSIBM    VARCHAR                 128     0 No    
TBCREATOR                      SYSIBM    VARCHAR                 128     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   
COLTYPE                        SYSIBM    CHARACTER                 8     0 No    
NULLS                          SYSIBM    CHARACTER                 1     0 No    
CODEPAGE                       SYSIBM    SMALLINT                  2     0 No    
DBCSCODEPG                     SYSIBM    SMALLINT                  2     0 No    
LENGTH                         SYSIBM    SMALLINT                  2     0 No    
SCALE                          SYSIBM    SMALLINT                  2     0 No    
COLNO                          SYSIBM    SMALLINT                  2     0 No    
COLCARD                        SYSIBM    BIGINT                    8     0 No    
HIGH2KEY                       SYSIBM    VARCHAR                 254     0 Yes   
LOW2KEY                        SYSIBM    VARCHAR                 254     0 Yes   
AVGCOLLEN                      SYSIBM    INTEGER                   4     0 No    
KEYSEQ                         SYSIBM    SMALLINT                  2     0 Yes   
TYPENAME                       SYSIBM    VARCHAR                  18     0 No    
TYPESCHEMA                     SYSIBM    VARCHAR                 128     0 No    
DEFAULT                        SYSIBM    VARCHAR                 254     0 Yes   
LONGLENGTH                     SYSIBM    INTEGER                   4     0 No    
LOGGED                         SYSIBM    CHARACTER                 1     0 No    
COMPACT                        SYSIBM    CHARACTER                 1     0 No    
NQUANTILES                     SYSIBM    SMALLINT                  2     0 No    
NMOSTFREQ                      SYSIBM    SMALLINT                  2     0 No    
COMPOSITE_CODEPAGE             SYSIBM    SMALLINT                  2     0 No    
PARTKEYSEQ                     SYSIBM    SMALLINT                  2     0 Yes   
SOURCE_TABSCHEMA               SYSIBM    VARCHAR                 128     0 Yes   
SOURCE_TABNAME                 SYSIBM    VARCHAR                 128     0 Yes   
HIDDEN                         SYSIBM    CHARACTER                 1     0 No    
GENERATED                      SYSIBM    CHARACTER                 1     0 No    
INLINE_LENGTH                  SYSIBM    INTEGER                   4     0 No    
NUMNULLS                       SYSIBM    BIGINT                    8     0 No    
DATAMODEL                      SYSIBM    INTEGER                   4     0 No    
SUB_COUNT                      SYSIBM    SMALLINT                  2     0 No    
SUB_DELIM_LENGTH               SYSIBM    SMALLINT                  2     0 No    
IDENTITY                       SYSIBM    CHARACTER                 1     0 No    

  36 record(s) selected.


describe table SYSIBM.SYSCONSTDEP

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
BNAME                          SYSIBM    VARCHAR                  18     0 No    
BCREATOR                       SYSIBM    VARCHAR                 128     0 No    
BTYPE                          SYSIBM    CHARACTER                 1     0 No    
DTBNAME                        SYSIBM    VARCHAR                 128     0 No    
DTBCREATOR                     SYSIBM    VARCHAR                 128     0 No    
DCONSTNAME                     SYSIBM    VARCHAR                  18     0 No    

  6 record(s) selected.


describe table SYSIBM.SYSDATATYPES

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
NAME                           SYSIBM    VARCHAR                  18     0 No    
SCHEMA                         SYSIBM    VARCHAR                 128     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
SOURCETYPE                     SYSIBM    VARCHAR                  18     0 Yes   
SOURCESCHEMA                   SYSIBM    VARCHAR                 128     0 Yes   
METATYPE                       SYSIBM    CHARACTER                 1     0 No    
TYPEID                         SYSIBM    SMALLINT                  2     0 No    
SOURCETYPEID                   SYSIBM    SMALLINT                  2     0 Yes   
LENGTH                         SYSIBM    INTEGER                   4     0 No    
SCALE                          SYSIBM    SMALLINT                  2     0 No    
CODEPAGE                       SYSIBM    SMALLINT                  2     0 No    
CREATE_TIME                    SYSIBM    TIMESTAMP                10     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   
PACKED_DESC                    SYSIBM    BLOB                2097152     0 Yes   
TYPE_DESC                      SYSIBM    BLOB                1048576     0 Yes   
ATTRCOUNT                      SYSIBM    SMALLINT                  2     0 No    
INSTANTIABLE                   SYSIBM    CHARACTER                 1     0 No    
WITH_FUNC_ACCESS               SYSIBM    CHARACTER                 1     0 No    
FINAL                          SYSIBM    CHARACTER                 1     0 No    
INLINE_LENGTH                  SYSIBM    INTEGER                   4     0 No    

  20 record(s) selected.


describe table SYSIBM.SYSDBAUTH

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
GRANTOR                        SYSIBM    VARCHAR                 128     0 No    
GRANTEE                        SYSIBM    VARCHAR                 128     0 No    
DBADMAUTH                      SYSIBM    CHARACTER                 1     0 No    
CREATETABAUTH                  SYSIBM    CHARACTER                 1     0 No    
BINDADDAUTH                    SYSIBM    CHARACTER                 1     0 No    
CONNECTAUTH                    SYSIBM    CHARACTER                 1     0 No    
NOFENCEAUTH                    SYSIBM    CHARACTER                 1     0 No    
GRANTEETYPE                    SYSIBM    CHARACTER                 1     0 No    
IMPLSCHEMAAUTH                 SYSIBM    CHARACTER                 1     0 No    
LOADAUTH                       SYSIBM    CHARACTER                 1     0 No    

  10 record(s) selected.


describe table SYSIBM.SYSDEPENDENCIES

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
BNAME                          SYSIBM    VARCHAR                 128     0 No    
BSCHEMA                        SYSIBM    VARCHAR                 128     0 No    
BTYPE                          SYSIBM    CHARACTER                 1     0 No    
DNAME                          SYSIBM    VARCHAR                  18     0 No    
DSCHEMA                        SYSIBM    VARCHAR                 128     0 No    
TABAUTH                        SYSIBM    SMALLINT                  2     0 Yes   
DTYPE                          SYSIBM    CHARACTER                 1     0 No    

  7 record(s) selected.


describe table SYSIBM.SYSDUMMY1

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
IBMREQD                        SYSIBM    VARCHAR                   1     0 No    

  1 record(s) selected.


describe table SYSIBM.SYSEVENTMONITORS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
NAME                           SYSIBM    VARCHAR                  18     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
TARGET_TYPE                    SYSIBM    CHARACTER                 1     0 No    
TARGET                         SYSIBM    VARCHAR                 246     0 No    
MAXFILES                       SYSIBM    INTEGER                   4     0 Yes   
MAXFILESIZE                    SYSIBM    INTEGER                   4     0 Yes   
BUFFERSIZE                     SYSIBM    INTEGER                   4     0 Yes   
IO_MODE                        SYSIBM    CHARACTER                 1     0 Yes   
WRITE_MODE                     SYSIBM    CHARACTER                 1     0 Yes   
AUTOSTART                      SYSIBM    CHARACTER                 1     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   
PACKED_DESC                    SYSIBM    BLOB                  65536     0 No    
NODENUM                        SYSIBM    SMALLINT                  2     0 No    
MONSCOPE                       SYSIBM    CHARACTER                 1     0 No    

  14 record(s) selected.


describe table SYSIBM.SYSEVENTS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
NAME                           SYSIBM    VARCHAR                  18     0 No    
TYPE                           SYSIBM    VARCHAR                  18     0 No    
FILTER                         SYSIBM    CLOB                  32768     0 Yes   

  3 record(s) selected.


describe table SYSIBM.SYSFUNCMAPOPTIONS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
FUNCTION_MAPPING               SYSIBM    VARCHAR                  18     0 No    
OPTION                         SYSIBM    VARCHAR                 128     0 No    
SETTING                        SYSIBM    VARCHAR                 255     0 No    

  3 record(s) selected.


describe table SYSIBM.SYSFUNCMAPPARMOPTIONS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
FUNCTION_MAPPING               SYSIBM    VARCHAR                  18     0 No    
ORDINAL                        SYSIBM    SMALLINT                  2     0 No    
LOCATION                       SYSIBM    CHARACTER                 1     0 No    
OPTION                         SYSIBM    VARCHAR                 128     0 No    
SETTING                        SYSIBM    VARCHAR                 255     0 No    

  5 record(s) selected.


describe table SYSIBM.SYSFUNCMAPPINGS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
FUNCTION_MAPPING               SYSIBM    VARCHAR                  18     0 No    
FUNCSCHEMA                     SYSIBM    VARCHAR                 128     0 Yes   
FUNCNAME                       SYSIBM    VARCHAR                1024     0 Yes   
FUNCID                         SYSIBM    INTEGER                   4     0 Yes   
SPECIFICNAME                   SYSIBM    VARCHAR                  18     0 Yes   
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
SERVERNAME                     SYSIBM    VARCHAR                 128     0 Yes   
SERVERTYPE                     SYSIBM    VARCHAR                  30     0 Yes   
SERVERVERSION                  SYSIBM    VARCHAR                  18     0 Yes   
WRAPNAME                       SYSIBM    VARCHAR                 128     0 Yes   
CREATE_TIME                    SYSIBM    TIMESTAMP                10     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   

  12 record(s) selected.


describe table SYSIBM.SYSFUNCPARMS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
FNAME                          SYSIBM    VARCHAR                  18     0 No    
FSCHEMA                        SYSIBM    VARCHAR                 128     0 No    
FSPECIFIC                      SYSIBM    VARCHAR                  18     0 No    
ROWTYPE                        SYSIBM    CHARACTER                 1     0 No    
ORDINAL                        SYSIBM    SMALLINT                  2     0 No    
TYPENAME                       SYSIBM    VARCHAR                  18     0 No    
TYPESCHEMA                     SYSIBM    VARCHAR                 128     0 No    
LENGTH                         SYSIBM    INTEGER                   4     0 No    
SCALE                          SYSIBM    SMALLINT                  2     0 No    
CODEPAGE                       SYSIBM    SMALLINT                  2     0 No    
CAST_FUNCTION_ID               SYSIBM    INTEGER                   4     0 Yes   
PARMNAME                       SYSIBM    VARCHAR                 128     0 Yes   
AS_LOCATOR                     SYSIBM    CHARACTER                 1     0 No    
TARGET_TYPESCHEMA              SYSIBM    VARCHAR                 128     0 Yes   
TARGET_TYPENAME                SYSIBM    VARCHAR                  18     0 Yes   
SCOPE_TABSCHEMA                SYSIBM    VARCHAR                 128     0 Yes   
SCOPE_TABNAME                  SYSIBM    VARCHAR                 128     0 Yes   
TRANSFORM_GRPNAME              SYSIBM    VARCHAR                  18     0 Yes   

  18 record(s) selected.


describe table SYSIBM.SYSFUNCTIONS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
NAME                           SYSIBM    VARCHAR                  18     0 No    
SCHEMA                         SYSIBM    VARCHAR                 128     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
SPECIFIC                       SYSIBM    VARCHAR                  18     0 No    
PARM_SIGNATURE                 SYSIBM    VARCHAR                 180     0 No    
FUNCTION_ID                    SYSIBM    INTEGER                   4     0 No    
RETURN_TYPE                    SYSIBM    SMALLINT                  2     0 No    
ORIGIN                         SYSIBM    CHARACTER                 1     0 No    
TYPE                           SYSIBM    CHARACTER                 1     0 No    
CREATE_TIME                    SYSIBM    TIMESTAMP                10     0 No    
PARM_COUNT                     SYSIBM    SMALLINT                  2     0 No    
VARIANT                        SYSIBM    CHARACTER                 1     0 No    
SIDE_EFFECTS                   SYSIBM    CHARACTER                 1     0 No    
FENCED                         SYSIBM    CHARACTER                 1     0 No    
NULLCALL                       SYSIBM    CHARACTER                 1     0 No    
CAST_FUNCTION                  SYSIBM    CHARACTER                 1     0 No    
ASSIGN_FUNCTION                SYSIBM    CHARACTER                 1     0 No    
SCRATCHPAD                     SYSIBM    CHARACTER                 1     0 No    
FINAL_CALL                     SYSIBM    CHARACTER                 1     0 No    
LANGUAGE                       SYSIBM    CHARACTER                 8     0 No    
IMPLEMENTATION                 SYSIBM    VARCHAR                 254     0 Yes   
SOURCE_SPECIFIC                SYSIBM    VARCHAR                  18     0 Yes   
SOURCE_SCHEMA                  SYSIBM    VARCHAR                 128     0 Yes   
IOS_PER_INVOC                  SYSIBM    DOUBLE                    8     0 No    
INSTS_PER_INVOC                SYSIBM    DOUBLE                    8     0 No    
IOS_PER_ARGBYTE                SYSIBM    DOUBLE                    8     0 No    
INSTS_PER_ARGBYTE              SYSIBM    DOUBLE                    8     0 No    
PERCENT_ARGBYTES               SYSIBM    SMALLINT                  2     0 No    
INITIAL_IOS                    SYSIBM    DOUBLE                    8     0 No    
INITIAL_INSTS                  SYSIBM    DOUBLE                    8     0 No    
INTERNAL_PREC1                 SYSIBM    INTEGER                   4     0 No    
INTERNAL_PREC2                 SYSIBM    DOUBLE                    8     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   
INTERNAL_DESC                  SYSIBM    BLOB               20971520     0 No    
PARALLELIZABLE                 SYSIBM    CHARACTER                 1     0 No    
CONTAINS_SQL                   SYSIBM    CHARACTER                 1     0 No    
DBINFO                         SYSIBM    CHARACTER                 1     0 No    
RESULT_COLS                    SYSIBM    SMALLINT                  2     0 No    
BODY                           SYSIBM    CLOB                1048576     0 Yes   
CARDINALITY                    SYSIBM    BIGINT                    8     0 No    
PARM_STYLE                     SYSIBM    CHARACTER                 8     0 No    
METHOD                         SYSIBM    CHARACTER                 1     0 No    
IMPLEMENTED                    SYSIBM    CHARACTER                 1     0 No    
EFFECT                         SYSIBM    CHARACTER                 2     0 No    
FUNC_PATH                      SYSIBM    VARCHAR                 254     0 Yes   
TYPE_PRESERVING                SYSIBM    CHARACTER                 1     0 No    
WITH_FUNC_ACCESS               SYSIBM    CHARACTER                 1     0 No    
SELECTIVITY                    SYSIBM    DOUBLE                    8     0 No    
OVERRIDDEN_FUNCID              SYSIBM    INTEGER                   4     0 Yes   
SUBJECT_TYPESCHEMA             SYSIBM    VARCHAR                 128     0 Yes   
SUBJECT_TYPENAME               SYSIBM    VARCHAR                  18     0 Yes   
QUALIFIER                      SYSIBM    VARCHAR                 128     0 No    
CLASS                          SYSIBM    VARCHAR                 128     0 Yes   
JAR_ID                         SYSIBM    VARCHAR                 128     0 Yes   

  54 record(s) selected.


describe table SYSIBM.SYSHIERARCHIES

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
METATYPE                       SYSIBM    CHARACTER                 1     0 No    
SUB_SCHEMA                     SYSIBM    VARCHAR                 128     0 No    
SUB_NAME                       SYSIBM    VARCHAR                 128     0 No    
SUPER_SCHEMA                   SYSIBM    VARCHAR                 128     0 No    
SUPER_NAME                     SYSIBM    VARCHAR                 128     0 No    
ROOT_SCHEMA                    SYSIBM    VARCHAR                 128     0 No    
ROOT_NAME                      SYSIBM    VARCHAR                 128     0 No    

  7 record(s) selected.


describe table SYSIBM.SYSINDEXAUTH

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
GRANTOR                        SYSIBM    VARCHAR                 128     0 No    
GRANTEE                        SYSIBM    VARCHAR                 128     0 No    
NAME                           SYSIBM    VARCHAR                  18     0 No    
CREATOR                        SYSIBM    VARCHAR                 128     0 No    
CONTROLAUTH                    SYSIBM    CHARACTER                 1     0 No    
GRANTEETYPE                    SYSIBM    CHARACTER                 1     0 No    

  6 record(s) selected.


describe table SYSIBM.SYSINDEXCOLUSE

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
INDSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
INDNAME                        SYSIBM    VARCHAR                  18     0 No    
COLNAME                        SYSIBM    VARCHAR                 128     0 No    
COLSEQ                         SYSIBM    SMALLINT                  2     0 No    
COLORDER                       SYSIBM    CHARACTER                 1     0 No    

  5 record(s) selected.


describe table SYSIBM.SYSINDEXES

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
NAME                           SYSIBM    VARCHAR                  18     0 No    
CREATOR                        SYSIBM    VARCHAR                 128     0 No    
TBNAME                         SYSIBM    VARCHAR                 128     0 No    
TBCREATOR                      SYSIBM    VARCHAR                 128     0 No    
COLNAMES                       SYSIBM    VARCHAR                 640     0 No    
UNIQUERULE                     SYSIBM    CHARACTER                 1     0 No    
COLCOUNT                       SYSIBM    SMALLINT                  2     0 No    
IID                            SYSIBM    SMALLINT                  2     0 No    
NLEAF                          SYSIBM    INTEGER                   4     0 No    
NLEVELS                        SYSIBM    SMALLINT                  2     0 No    
FIRSTKEYCARD                   SYSIBM    BIGINT                    8     0 No    
FULLKEYCARD                    SYSIBM    BIGINT                    8     0 No    
CLUSTERRATIO                   SYSIBM    SMALLINT                  2     0 No    
CLUSTERFACTOR                  SYSIBM    DOUBLE                    8     0 No    
USER_DEFINED                   SYSIBM    SMALLINT                  2     0 No    
SYSTEM_REQUIRED                SYSIBM    SMALLINT                  2     0 No    
CREATE_TIME                    SYSIBM    TIMESTAMP                10     0 No    
STATS_TIME                     SYSIBM    TIMESTAMP                10     0 Yes   
PAGE_FETCH_PAIRS               SYSIBM    VARCHAR                 254     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
MADE_UNIQUE                    SYSIBM    CHARACTER                 1     0 No    
SEQUENTIAL_PAGES               SYSIBM    INTEGER                   4     0 No    
DENSITY                        SYSIBM    INTEGER                   4     0 No    
FIRST2KEYCARD                  SYSIBM    BIGINT                    8     0 No    
FIRST3KEYCARD                  SYSIBM    BIGINT                    8     0 No    
FIRST4KEYCARD                  SYSIBM    BIGINT                    8     0 No    
PCTFREE                        SYSIBM    SMALLINT                  2     0 No    
UNIQUE_COLCOUNT                SYSIBM    SMALLINT                  2     0 No    
INDEXTYPE                      SYSIBM    CHARACTER                 4     0 No    
ENTRYTYPE                      SYSIBM    CHARACTER                 1     0 No    
MINPCTUSED                     SYSIBM    SMALLINT                  2     0 No    
REVERSE_SCANS                  SYSIBM    CHARACTER                 1     0 No    
IESCHEMA                       SYSIBM    VARCHAR                 128     0 Yes   
IENAME                         SYSIBM    VARCHAR                  18     0 Yes   
IEARGUMENTS                    SYSIBM    CLOB                  32768     0 Yes   
INDEX_DESC                     SYSIBM    BLOB                1048576     0 Yes   
INTERNAL_FORMAT                SYSIBM    SMALLINT                  2     0 No    

  38 record(s) selected.


describe table SYSIBM.SYSINDEXEXPLOITRULES

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
FUNCID                         SYSIBM    INTEGER                   4     0 No    
SPECID                         SYSIBM    SMALLINT                  2     0 No    
IESCHEMA                       SYSIBM    VARCHAR                 128     0 No    
IENAME                         SYSIBM    VARCHAR                  18     0 No    
RULEID                         SYSIBM    SMALLINT                  2     0 No    
SEARCHMETHODID                 SYSIBM    SMALLINT                  2     0 No    
SEARCHKEY                      SYSIBM    VARCHAR                 320     0 No    
SEARCHARGUMENT                 SYSIBM    VARCHAR                1800     0 No    

  8 record(s) selected.


describe table SYSIBM.SYSINDEXEXTENSIONMETHODS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
METHODNAME                     SYSIBM    VARCHAR                  18     0 No    
METHODID                       SYSIBM    SMALLINT                  2     0 No    
IESCHEMA                       SYSIBM    VARCHAR                 128     0 No    
IENAME                         SYSIBM    VARCHAR                  18     0 No    
RTFUNCSCHEMA                   SYSIBM    VARCHAR                 128     0 No    
RTFUNCNAME                     SYSIBM    VARCHAR                  18     0 No    
RTSPECIFICNAME                 SYSIBM    VARCHAR                  18     0 No    
CWFUNCSCHEMA                   SYSIBM    VARCHAR                 128     0 Yes   
CWFUNCNAME                     SYSIBM    VARCHAR                  18     0 Yes   
CWSPECIFICNAME                 SYSIBM    VARCHAR                  18     0 Yes   
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   

  11 record(s) selected.


describe table SYSIBM.SYSINDEXEXTENSIONPARMS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
IESCHEMA                       SYSIBM    VARCHAR                 128     0 No    
IENAME                         SYSIBM    VARCHAR                  18     0 No    
ORDINAL                        SYSIBM    SMALLINT                  2     0 No    
PARMNAME                       SYSIBM    VARCHAR                  18     0 No    
TYPESCHEMA                     SYSIBM    VARCHAR                 128     0 No    
TYPENAME                       SYSIBM    VARCHAR                  18     0 No    
LENGTH                         SYSIBM    INTEGER                   4     0 No    
SCALE                          SYSIBM    SMALLINT                  2     0 No    
PARMTYPE                       SYSIBM    CHARACTER                 1     0 No    
CODEPAGE                       SYSIBM    SMALLINT                  2     0 No    

  10 record(s) selected.


describe table SYSIBM.SYSINDEXEXTENSIONS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
IESCHEMA                       SYSIBM    VARCHAR                 128     0 No    
IENAME                         SYSIBM    VARCHAR                  18     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
CREATE_TIME                    SYSIBM    TIMESTAMP                10     0 No    
KTFUNCSCHEMA                   SYSIBM    VARCHAR                 128     0 No    
KTFUNCNAME                     SYSIBM    VARCHAR                  18     0 No    
KTSPECIFICNAME                 SYSIBM    VARCHAR                  18     0 No    
TEXT                           SYSIBM    CLOB                  65536     0 No    
INDEX_DESC                     SYSIBM    BLOB               10485760     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   

  10 record(s) selected.


describe table SYSIBM.SYSINDEXOPTIONS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
INDSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
INDNAME                        SYSIBM    VARCHAR                  18     0 No    
OPTION                         SYSIBM    VARCHAR                 128     0 No    
SETTING                        SYSIBM    VARCHAR                 255     0 No    

  4 record(s) selected.


describe table SYSIBM.SYSJARCONTENTS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
JARSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
JAR_ID                         SYSIBM    VARCHAR                 128     0 No    
CLASS                          SYSIBM    VARCHAR                 128     0 No    
CLASS_SOURCE                   SYSIBM    CLOB               10485760     0 Yes   

  4 record(s) selected.


describe table SYSIBM.SYSJAROBJECTS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
JARSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
JAR_ID                         SYSIBM    VARCHAR                 128     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
JAR_DATA                       SYSIBM    BLOB              104857600     0 Yes   

  4 record(s) selected.


describe table SYSIBM.SYSKEYCOLUSE

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
CONSTNAME                      SYSIBM    VARCHAR                  18     0 No    
TBNAME                         SYSIBM    VARCHAR                 128     0 No    
TBCREATOR                      SYSIBM    VARCHAR                 128     0 No    
COLNAME                        SYSIBM    VARCHAR                 128     0 No    
COLSEQ                         SYSIBM    SMALLINT                  2     0 No    

  5 record(s) selected.


describe table SYSIBM.SYSNAMEMAPPINGS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
TYPE                           SYSIBM    CHARACTER                 1     0 No    
LOGICAL_SCHEMA                 SYSIBM    VARCHAR                 128     0 No    
LOGICAL_NAME                   SYSIBM    VARCHAR                 128     0 No    
LOGICAL_COLNAME                SYSIBM    VARCHAR                 128     0 Yes   
IMPL_SCHEMA                    SYSIBM    VARCHAR                 128     0 No    
IMPL_NAME                      SYSIBM    VARCHAR                 128     0 No    
IMPL_COLNAME                   SYSIBM    VARCHAR                 128     0 Yes   

  7 record(s) selected.


describe table SYSIBM.SYSNODEGROUPDEF

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
NGNAME                         SYSIBM    VARCHAR                  18     0 No    
NODENUM                        SYSIBM    SMALLINT                  2     0 No    
IN_USE                         SYSIBM    CHARACTER                 1     0 No    

  3 record(s) selected.


describe table SYSIBM.SYSNODEGROUPS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
NAME                           SYSIBM    VARCHAR                  18     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
PMAP_ID                        SYSIBM    SMALLINT                  2     0 No    
REBALANCE_PMAP_ID              SYSIBM    SMALLINT                  2     0 No    
CTIME                          SYSIBM    TIMESTAMP                10     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   

  6 record(s) selected.


describe table SYSIBM.SYSPARTITIONMAPS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
PMAP_ID                        SYSIBM    SMALLINT                  2     0 No    
PARTITIONMAP                   SYSIBM    LONG VARCHAR          32700     0 No    

  2 record(s) selected.


describe table SYSIBM.SYSPASSTHRUAUTH

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
GRANTOR                        SYSIBM    VARCHAR                 128     0 No    
GRANTEE                        SYSIBM    VARCHAR                 128     0 No    
GRANTEETYPE                    SYSIBM    CHARACTER                 1     0 No    
SERVERNAME                     SYSIBM    VARCHAR                 128     0 No    

  4 record(s) selected.


describe table SYSIBM.SYSPLAN

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
NAME                           SYSIBM    CHARACTER                 8     0 No    
CREATOR                        SYSIBM    VARCHAR                 128     0 No    
BOUNDBY                        SYSIBM    VARCHAR                 128     0 No    
VALID                          SYSIBM    CHARACTER                 1     0 No    
UNIQUE_ID                      SYSIBM    CHARACTER                 8     0 No    
TOTALSECT                      SYSIBM    SMALLINT                  2     0 No    
FORMAT                         SYSIBM    CHARACTER                 1     0 No    
SECT_INFO                      SYSIBM    BLOB                1048576     0 No    
HOST_VARS                      SYSIBM    BLOB                1048576     0 Yes   
ISOLATION                      SYSIBM    CHARACTER                 2     0 Yes   
BLOCK                          SYSIBM    CHARACTER                 1     0 Yes   
STANDARDS_LEVEL                SYSIBM    CHARACTER                 1     0 Yes   
FUNC_PATH                      SYSIBM    VARCHAR                 254     0 No    
EXPLICIT_BIND_TIME             SYSIBM    TIMESTAMP                10     0 No    
LAST_BIND_TIME                 SYSIBM    TIMESTAMP                10     0 No    
QUERYOPT                       SYSIBM    INTEGER                   4     0 No    
EXPLAIN_LEVEL                  SYSIBM    CHARACTER                 1     0 No    
EXPLAIN_MODE                   SYSIBM    CHARACTER                 1     0 No    
EXPLAIN_SNAPSHOT               SYSIBM    CHARACTER                 1     0 No    
SQLWARN                        SYSIBM    CHARACTER                 1     0 No    
CODEPAGE                       SYSIBM    SMALLINT                  2     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   
SQLRULES                       SYSIBM    CHARACTER                 1     0 No    
SQLRULES_STRING                SYSIBM    VARCHAR                 254     0 No    
INSERT_BUF                     SYSIBM    CHARACTER                 1     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
DEFAULT_SCHEMA                 SYSIBM    VARCHAR                 128     0 No    
MULTINODE_PLANS                SYSIBM    CHARACTER                 1     0 No    
DEGREE                         SYSIBM    CHARACTER                 5     0 No    
RDS_LEVEL                      SYSIBM    SMALLINT                  2     0 No    
SQLMATHWARN                    SYSIBM    CHARACTER                 1     0 No    
INTRA_PARALLEL                 SYSIBM    CHARACTER                 1     0 No    
VALIDATE                       SYSIBM    CHARACTER                 1     0 No    
DYNAMICRULES                   SYSIBM    CHARACTER                 1     0 No    
SQLERROR                       SYSIBM    CHARACTER                 1     0 No    
REFRESHAGE                     SYSIBM    DECIMAL                  20     6 No    

  36 record(s) selected.


describe table SYSIBM.SYSPLANAUTH

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
GRANTOR                        SYSIBM    VARCHAR                 128     0 No    
GRANTEE                        SYSIBM    VARCHAR                 128     0 No    
NAME                           SYSIBM    CHARACTER                 8     0 No    
CREATOR                        SYSIBM    VARCHAR                 128     0 No    
CONTROLAUTH                    SYSIBM    CHARACTER                 1     0 No    
BINDAUTH                       SYSIBM    CHARACTER                 1     0 No    
EXECUTEAUTH                    SYSIBM    CHARACTER                 1     0 No    
GRANTEETYPE                    SYSIBM    CHARACTER                 1     0 No    

  8 record(s) selected.


describe table SYSIBM.SYSPLANDEP

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
BNAME                          SYSIBM    VARCHAR                 128     0 No    
BCREATOR                       SYSIBM    VARCHAR                 128     0 No    
BTYPE                          SYSIBM    CHARACTER                 1     0 No    
DNAME                          SYSIBM    CHARACTER                 8     0 No    
DCREATOR                       SYSIBM    VARCHAR                 128     0 No    
BINDER                         SYSIBM    VARCHAR                 128     0 Yes   
TABAUTH                        SYSIBM    SMALLINT                  2     0 Yes   
TABUSAGE                       SYSIBM    SMALLINT                  2     0 No    
COLUSAGE                       SYSIBM    BLOB                   5120     0 Yes   

  9 record(s) selected.


describe table SYSIBM.SYSPREDICATESPECS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
FUNCID                         SYSIBM    INTEGER                   4     0 No    
SPECID                         SYSIBM    SMALLINT                  2     0 No    
CONTEXTOP                      SYSIBM    CHARACTER                 8     0 No    
CONTEXTEXP                     SYSIBM    CLOB                  32768     0 No    
FILTERTEXT                     SYSIBM    CLOB                  65536     0 Yes   
FILTERFUNCID                   SYSIBM    INTEGER                   4     0 Yes   

  6 record(s) selected.


describe table SYSIBM.SYSPROCEDURES

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
PROCSCHEMA                     SYSIBM    VARCHAR                 128     0 No    
PROCNAME                       SYSIBM    VARCHAR                 128     0 No    
SPECIFICNAME                   SYSIBM    VARCHAR                  18     0 No    
PROCEDURE_ID                   SYSIBM    INTEGER                   4     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
PARM_COUNT                     SYSIBM    SMALLINT                  2     0 No    
PARM_SIGNATURE                 SYSIBM    VARCHAR                 180     0 No    
ORIGIN                         SYSIBM    CHARACTER                 1     0 No    
CREATE_TIME                    SYSIBM    TIMESTAMP                10     0 No    
FENCED                         SYSIBM    CHARACTER                 1     0 No    
NULLCALL                       SYSIBM    CHARACTER                 1     0 No    
LANGUAGE                       SYSIBM    CHARACTER                 8     0 No    
IMPLEMENTATION                 SYSIBM    VARCHAR                 254     0 Yes   
PARM_STYLE                     SYSIBM    CHARACTER                 8     0 No    
RESULT_SETS                    SYSIBM    SMALLINT                  2     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   
DETERMINISTIC                  SYSIBM    CHARACTER                 1     0 No    
PACKED_DESC                    SYSIBM    BLOB                2097152     0 Yes   
CONTAINS_SQL                   SYSIBM    CHARACTER                 1     0 No    
DBINFO                         SYSIBM    CHARACTER                 1     0 No    
PROGRAM_TYPE                   SYSIBM    CHARACTER                 1     0 No    
VALID                          SYSIBM    CHARACTER                 1     0 No    
CLASS                          SYSIBM    VARCHAR                 128     0 Yes   
JAR_ID                         SYSIBM    VARCHAR                 128     0 Yes   
TEXT_BODY_OFFSET               SYSIBM    INTEGER                   4     0 No    
TEXT                           SYSIBM    CLOB                1048576     0 Yes   

  26 record(s) selected.


describe table SYSIBM.SYSPROCOPTIONS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
PROCSCHEMA                     SYSIBM    VARCHAR                 128     0 No    
PROCNAME                       SYSIBM    VARCHAR                 128     0 No    
OPTION                         SYSIBM    VARCHAR                 128     0 No    
SETTING                        SYSIBM    VARCHAR                 255     0 No    

  4 record(s) selected.


describe table SYSIBM.SYSPROCPARMOPTIONS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
PROCSCHEMA                     SYSIBM    VARCHAR                 128     0 No    
PROCNAME                       SYSIBM    VARCHAR                 128     0 No    
ORDINAL                        SYSIBM    SMALLINT                  2     0 No    
OPTION                         SYSIBM    VARCHAR                 128     0 No    
SETTING                        SYSIBM    VARCHAR                 255     0 No    

  5 record(s) selected.


describe table SYSIBM.SYSPROCPARMS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
PROCSCHEMA                     SYSIBM    VARCHAR                 128     0 No    
PROCNAME                       SYSIBM    VARCHAR                 128     0 No    
SPECIFICNAME                   SYSIBM    VARCHAR                  18     0 No    
ORDINAL                        SYSIBM    SMALLINT                  2     0 No    
PARMNAME                       SYSIBM    VARCHAR                 128     0 No    
TYPESCHEMA                     SYSIBM    VARCHAR                 128     0 No    
TYPENAME                       SYSIBM    VARCHAR                  18     0 No    
LENGTH                         SYSIBM    INTEGER                   4     0 No    
SCALE                          SYSIBM    SMALLINT                  2     0 No    
CODEPAGE                       SYSIBM    SMALLINT                  2     0 No    
PARM_MODE                      SYSIBM    VARCHAR                   5     0 No    
AS_LOCATOR                     SYSIBM    CHARACTER                 1     0 No    
TARGET_TYPESCHEMA              SYSIBM    VARCHAR                 128     0 Yes   
TARGET_TYPENAME                SYSIBM    VARCHAR                  18     0 Yes   
SCOPE_TABSCHEMA                SYSIBM    VARCHAR                 128     0 Yes   
SCOPE_TABNAME                  SYSIBM    VARCHAR                 128     0 Yes   
TYPEID                         SYSIBM    SMALLINT                  2     0 Yes   
SOURCETYPEID                   SYSIBM    SMALLINT                  2     0 Yes   
SERVERNAME                     SYSIBM    VARCHAR                 128     0 Yes   
DBCS_CODEPAGE                  SYSIBM    SMALLINT                  2     0 Yes   
NULLS                          SYSIBM    CHARACTER                 1     0 No    

  21 record(s) selected.


describe table SYSIBM.SYSRELS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
CREATOR                        SYSIBM    VARCHAR                 128     0 No    
TBNAME                         SYSIBM    VARCHAR                 128     0 No    
RELNAME                        SYSIBM    VARCHAR                  18     0 No    
REFTBNAME                      SYSIBM    VARCHAR                 128     0 No    
REFTBCREATOR                   SYSIBM    VARCHAR                 128     0 No    
COLCOUNT                       SYSIBM    SMALLINT                  2     0 No    
DELETERULE                     SYSIBM    CHARACTER                 1     0 No    
UPDATERULE                     SYSIBM    CHARACTER                 1     0 No    
TIMESTAMP                      SYSIBM    TIMESTAMP                10     0 No    
FKCOLNAMES                     SYSIBM    VARCHAR                 640     0 No    
PKCOLNAMES                     SYSIBM    VARCHAR                 640     0 No    
REFKEYNAME                     SYSIBM    VARCHAR                  18     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 No    

  13 record(s) selected.


describe table SYSIBM.SYSREVTYPEMAPPINGS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
TYPE_MAPPING                   SYSIBM    VARCHAR                  18     0 No    
TYPESCHEMA                     SYSIBM    VARCHAR                 128     0 Yes   
TYPENAME                       SYSIBM    VARCHAR                  18     0 No    
TYPEID                         SYSIBM    SMALLINT                  2     0 No    
SOURCETYPEID                   SYSIBM    SMALLINT                  2     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
LOWER_LEN                      SYSIBM    INTEGER                   4     0 Yes   
UPPER_LEN                      SYSIBM    INTEGER                   4     0 Yes   
LOWER_SCALE                    SYSIBM    SMALLINT                  2     0 Yes   
UPPER_SCALE                    SYSIBM    SMALLINT                  2     0 Yes   
S_OPR_P                        SYSIBM    CHARACTER                 2     0 Yes   
BIT_DATA                       SYSIBM    CHARACTER                 1     0 Yes   
WRAPNAME                       SYSIBM    VARCHAR                 128     0 Yes   
SERVERNAME                     SYSIBM    VARCHAR                 128     0 Yes   
SERVERTYPE                     SYSIBM    VARCHAR                  30     0 Yes   
SERVERVERSION                  SYSIBM    VARCHAR                  18     0 Yes   
REMOTE_TYPESCHEMA              SYSIBM    VARCHAR                 128     0 Yes   
REMOTE_TYPENAME                SYSIBM    VARCHAR                 128     0 No    
REMOTE_META_TYPE               SYSIBM    CHARACTER                 1     0 Yes   
REMOTE_LENGTH                  SYSIBM    INTEGER                   4     0 Yes   
REMOTE_SCALE                   SYSIBM    SMALLINT                  2     0 Yes   
REMOTE_BIT_DATA                SYSIBM    CHARACTER                 1     0 Yes   
USER_DEFINED                   SYSIBM    CHARACTER                 1     0 Yes   
CREATE_TIME                    SYSIBM    TIMESTAMP                10     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   

  25 record(s) selected.


describe table SYSIBM.SYSSCHEMAAUTH

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
GRANTOR                        SYSIBM    VARCHAR                 128     0 No    
GRANTEE                        SYSIBM    VARCHAR                 128     0 No    
GRANTEETYPE                    SYSIBM    CHARACTER                 1     0 No    
SCHEMANAME                     SYSIBM    VARCHAR                 128     0 No    
CREATEINAUTH                   SYSIBM    CHARACTER                 1     0 No    
DROPINAUTH                     SYSIBM    CHARACTER                 1     0 No    
ALTERINAUTH                    SYSIBM    CHARACTER                 1     0 No    

  7 record(s) selected.


describe table SYSIBM.SYSSCHEMATA

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
NAME                           SYSIBM    VARCHAR                 128     0 No    
OWNER                          SYSIBM    VARCHAR                 128     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
CREATE_TIME                    SYSIBM    TIMESTAMP                10     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   

  5 record(s) selected.


describe table SYSIBM.SYSSECTION

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
PLNAME                         SYSIBM    CHARACTER                 8     0 No    
PLCREATOR                      SYSIBM    VARCHAR                 128     0 No    
SECTNO                         SYSIBM    SMALLINT                  2     0 No    
SECTION                        SYSIBM    BLOB               10485760     0 No    
VALID                          SYSIBM    CHARACTER                 1     0 No    

  5 record(s) selected.


describe table SYSIBM.SYSSEQUENCES

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
SEQID                          SYSIBM    INTEGER                   4     0 No    
SEQSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
SEQNAME                        SYSIBM    VARCHAR                 128     0 No    
INCREMENT                      SYSIBM    DECIMAL                  31     0 No    
START                          SYSIBM    DECIMAL                  31     0 No    
MAXVALUE                       SYSIBM    DECIMAL                  31     0 Yes   
MINVALUE                       SYSIBM    DECIMAL                  31     0 Yes   
CYCLE                          SYSIBM    CHARACTER                 1     0 No    
CACHE                          SYSIBM    SMALLINT                  2     0 No    
ORDER                          SYSIBM    CHARACTER                 1     0 No    
ORIGIN                         SYSIBM    CHARACTER                 1     0 No    
TYPE                           SYSIBM    CHARACTER                 1     0 No    
SEQMGRFID                      SYSIBM    SMALLINT                  2     0 No    
SEQMGRTID                      SYSIBM    SMALLINT                  2     0 No    
DATATYPEID                     SYSIBM    INTEGER                   4     0 No    
SEQ_DESC                       SYSIBM    BLOB                  65536     0 Yes   
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   

  17 record(s) selected.


describe table SYSIBM.SYSSERVEROPTIONS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
WRAPNAME                       SYSIBM    VARCHAR                 128     0 Yes   
SERVERNAME                     SYSIBM    VARCHAR                 128     0 Yes   
SERVERTYPE                     SYSIBM    VARCHAR                  30     0 Yes   
SERVERVERSION                  SYSIBM    VARCHAR                  18     0 Yes   
CREATE_TIME                    SYSIBM    TIMESTAMP                10     0 No    
OPTION                         SYSIBM    VARCHAR                 128     0 No    
SETTING                        SYSIBM    VARCHAR                2048     0 No    
SERVEROPTIONKEY                SYSIBM    VARCHAR                  18     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   

  9 record(s) selected.


describe table SYSIBM.SYSSERVERS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
WRAPNAME                       SYSIBM    VARCHAR                 128     0 No    
SERVERNAME                     SYSIBM    VARCHAR                 128     0 No    
SERVERTYPE                     SYSIBM    VARCHAR                  30     0 Yes   
SERVERVERSION                  SYSIBM    VARCHAR                  18     0 Yes   
SERVER_DESC                    SYSIBM    BLOB               10485760     0 Yes   
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   

  6 record(s) selected.


describe table SYSIBM.SYSSTMT

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
PLNAME                         SYSIBM    CHARACTER                 8     0 No    
PLCREATOR                      SYSIBM    VARCHAR                 128     0 No    
STMTNO                         SYSIBM    INTEGER                   4     0 No    
SECTNO                         SYSIBM    SMALLINT                  2     0 No    
TEXT                           SYSIBM    CLOB                  65536     0 No    

  5 record(s) selected.


describe table SYSIBM.SYSTABAUTH

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
GRANTOR                        SYSIBM    VARCHAR                 128     0 No    
GRANTEE                        SYSIBM    VARCHAR                 128     0 No    
TCREATOR                       SYSIBM    VARCHAR                 128     0 No    
TTNAME                         SYSIBM    VARCHAR                 128     0 No    
TABAUTH                        SYSIBM    SMALLINT                  2     0 No    
CONTROLAUTH                    SYSIBM    CHARACTER                 1     0 No    
ALTERAUTH                      SYSIBM    CHARACTER                 1     0 No    
DELETEAUTH                     SYSIBM    CHARACTER                 1     0 No    
INDEXAUTH                      SYSIBM    CHARACTER                 1     0 No    
INSERTAUTH                     SYSIBM    CHARACTER                 1     0 No    
SELECTAUTH                     SYSIBM    CHARACTER                 1     0 No    
UPDATEAUTH                     SYSIBM    CHARACTER                 1     0 No    
REFAUTH                        SYSIBM    CHARACTER                 1     0 No    
GRANTEETYPE                    SYSIBM    CHARACTER                 1     0 No    

  14 record(s) selected.


describe table SYSIBM.SYSTABCONST

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
NAME                           SYSIBM    VARCHAR                  18     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
CONSTRAINTYP                   SYSIBM    CHARACTER                 1     0 No    
TBNAME                         SYSIBM    VARCHAR                 128     0 No    
TBCREATOR                      SYSIBM    VARCHAR                 128     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   

  6 record(s) selected.


describe table SYSIBM.SYSTABLES

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
NAME                           SYSIBM    VARCHAR                 128     0 No    
CREATOR                        SYSIBM    VARCHAR                 128     0 No    
TYPE                           SYSIBM    CHARACTER                 1     0 No    
CTIME                          SYSIBM    TIMESTAMP                10     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   
PACKED_DESC                    SYSIBM    BLOB               20971520     0 Yes   
VIEW_DESC                      SYSIBM    BLOB                 131072     0 Yes   
COLCOUNT                       SYSIBM    SMALLINT                  2     0 No    
FID                            SYSIBM    SMALLINT                  2     0 No    
TID                            SYSIBM    SMALLINT                  2     0 No    
CARD                           SYSIBM    BIGINT                    8     0 No    
NPAGES                         SYSIBM    INTEGER                   4     0 No    
FPAGES                         SYSIBM    INTEGER                   4     0 No    
OVERFLOW                       SYSIBM    INTEGER                   4     0 No    
PARENTS                        SYSIBM    SMALLINT                  2     0 Yes   
CHILDREN                       SYSIBM    SMALLINT                  2     0 Yes   
SELFREFS                       SYSIBM    SMALLINT                  2     0 Yes   
KEYCOLUMNS                     SYSIBM    SMALLINT                  2     0 Yes   
KEYOBID                        SYSIBM    SMALLINT                  2     0 Yes   
REL_DESC                       SYSIBM    BLOB                 262144     0 Yes   
BASE_NAME                      SYSIBM    VARCHAR                 128     0 Yes   
BASE_SCHEMA                    SYSIBM    VARCHAR                 128     0 Yes   
TBSPACE                        SYSIBM    VARCHAR                  18     0 Yes   
INDEX_TBSPACE                  SYSIBM    VARCHAR                  18     0 Yes   
LONG_TBSPACE                   SYSIBM    VARCHAR                  18     0 Yes   
KEYUNIQUE                      SYSIBM    SMALLINT                  2     0 No    
CHECKCOUNT                     SYSIBM    SMALLINT                  2     0 No    
CHECK_DESC                     SYSIBM    BLOB                 131072     0 Yes   
STATS_TIME                     SYSIBM    TIMESTAMP                10     0 Yes   
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
TRIG_DESC                      SYSIBM    BLOB                3145728     0 Yes   
DATA_CAPTURE                   SYSIBM    CHARACTER                 1     0 No    
STATUS                         SYSIBM    CHARACTER                 1     0 No    
CONST_CHECKED                  SYSIBM    CHARACTER                32     0 No    
PMAP_ID                        SYSIBM    SMALLINT                  2     0 Yes   
LOG_ATTRIBUTE                  SYSIBM    CHARACTER                 1     0 No    
PCTFREE                        SYSIBM    SMALLINT                  2     0 No    
ROWTYPESCHEMA                  SYSIBM    VARCHAR                 128     0 Yes   
ROWTYPENAME                    SYSIBM    VARCHAR                  18     0 Yes   
APPEND_MODE                    SYSIBM    CHARACTER                 1     0 No    
PARTITION_MODE                 SYSIBM    CHARACTER                 1     0 No    
REFRESH                        SYSIBM    CHARACTER                 1     0 No    
REFRESH_TIME                   SYSIBM    TIMESTAMP                10     0 Yes   
LOCKSIZE                       SYSIBM    CHARACTER                 1     0 No    
VOLATILE                       SYSIBM    CHARACTER                 1     0 No    
REMOTE_DESC                    SYSIBM    BLOB               10485760     0 Yes   

  46 record(s) selected.


describe table SYSIBM.SYSTABLESPACES

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
TBSPACE                        SYSIBM    VARCHAR                  18     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
CREATE_TIME                    SYSIBM    TIMESTAMP                10     0 No    
TBSPACEID                      SYSIBM    INTEGER                   4     0 No    
TBSPACETYPE                    SYSIBM    CHARACTER                 1     0 No    
DATATYPE                       SYSIBM    CHARACTER                 1     0 No    
EXTENTSIZE                     SYSIBM    INTEGER                   4     0 No    
PREFETCHSIZE                   SYSIBM    INTEGER                   4     0 No    
OVERHEAD                       SYSIBM    DOUBLE                    8     0 No    
TRANSFERRATE                   SYSIBM    DOUBLE                    8     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   
NGNAME                         SYSIBM    VARCHAR                  18     0 No    
BUFFERPOOLID                   SYSIBM    INTEGER                   4     0 No    
PAGESIZE                       SYSIBM    INTEGER                   4     0 No    
DROP_RECOVERY                  SYSIBM    CHARACTER                 1     0 No    

  15 record(s) selected.


describe table SYSIBM.SYSTABOPTIONS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
TABSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
TABNAME                        SYSIBM    VARCHAR                 128     0 No    
OPTION                         SYSIBM    VARCHAR                 128     0 No    
SETTING                        SYSIBM    VARCHAR                 255     0 No    

  4 record(s) selected.


describe table SYSIBM.SYSTBSPACEAUTH

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
GRANTOR                        SYSIBM    VARCHAR                 128     0 No    
GRANTEE                        SYSIBM    VARCHAR                 128     0 No    
GRANTEETYPE                    SYSIBM    CHARACTER                 1     0 No    
TBSPACEID                      SYSIBM    INTEGER                   4     0 No    
USEAUTH                        SYSIBM    CHARACTER                 1     0 No    

  5 record(s) selected.


describe table SYSIBM.SYSTRANSFORMS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
TYPEID                         SYSIBM    SMALLINT                  2     0 No    
GROUPNAME                      SYSIBM    VARCHAR                  18     0 No    
FROMSQL_FUNCID                 SYSIBM    INTEGER                   4     0 Yes   
TOSQL_FUNCID                   SYSIBM    INTEGER                   4     0 Yes   
FROMSQL_FORMAT                 SYSIBM    CHARACTER                 1     0 No    
TOSQL_FORMAT                   SYSIBM    CHARACTER                 1     0 No    
FROMSQL_LENGTH                 SYSIBM    INTEGER                   4     0 No    
ORIGIN                         SYSIBM    CHARACTER                 1     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   

  9 record(s) selected.


describe table SYSIBM.SYSTRIGGERS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
NAME                           SYSIBM    VARCHAR                  18     0 No    
SCHEMA                         SYSIBM    VARCHAR                 128     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
TBNAME                         SYSIBM    VARCHAR                 128     0 No    
TBCREATOR                      SYSIBM    VARCHAR                 128     0 No    
TRIGTIME                       SYSIBM    CHARACTER                 1     0 No    
TRIGEVENT                      SYSIBM    CHARACTER                 1     0 No    
GRANULARITY                    SYSIBM    CHARACTER                 1     0 No    
VALID                          SYSIBM    CHARACTER                 1     0 No    
TEXT                           SYSIBM    CLOB                  65536     0 No    
CREATE_TIME                    SYSIBM    TIMESTAMP                10     0 No    
FUNC_PATH                      SYSIBM    VARCHAR                 254     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   
QUALIFIER                      SYSIBM    VARCHAR                 128     0 No    

  14 record(s) selected.


describe table SYSIBM.SYSTYPEMAPPINGS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
TYPE_MAPPING                   SYSIBM    VARCHAR                  18     0 No    
TYPESCHEMA                     SYSIBM    VARCHAR                 128     0 Yes   
TYPENAME                       SYSIBM    VARCHAR                  18     0 No    
TYPEID                         SYSIBM    SMALLINT                  2     0 No    
SOURCETYPEID                   SYSIBM    SMALLINT                  2     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
LENGTH                         SYSIBM    INTEGER                   4     0 Yes   
SCALE                          SYSIBM    SMALLINT                  2     0 Yes   
BIT_DATA                       SYSIBM    CHARACTER                 1     0 Yes   
WRAPNAME                       SYSIBM    VARCHAR                 128     0 Yes   
SERVERNAME                     SYSIBM    VARCHAR                 128     0 Yes   
SERVERTYPE                     SYSIBM    VARCHAR                  30     0 Yes   
SERVERVERSION                  SYSIBM    VARCHAR                  18     0 Yes   
REMOTE_TYPESCHEMA              SYSIBM    VARCHAR                 128     0 Yes   
REMOTE_TYPENAME                SYSIBM    VARCHAR                 128     0 No    
REMOTE_META_TYPE               SYSIBM    CHARACTER                 1     0 Yes   
REMOTE_LOWER_LEN               SYSIBM    INTEGER                   4     0 Yes   
REMOTE_UPPER_LEN               SYSIBM    INTEGER                   4     0 Yes   
REMOTE_LOWER_SCALE             SYSIBM    SMALLINT                  2     0 Yes   
REMOTE_UPPER_SCALE             SYSIBM    SMALLINT                  2     0 Yes   
REMOTE_S_OPR_P                 SYSIBM    CHARACTER                 2     0 Yes   
REMOTE_BIT_DATA                SYSIBM    CHARACTER                 1     0 Yes   
USER_DEFINED                   SYSIBM    CHARACTER                 1     0 No    
CREATE_TIME                    SYSIBM    TIMESTAMP                10     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   

  25 record(s) selected.


describe table SYSIBM.SYSUSERAUTH

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
GRANTEE                        SYSIBM    VARCHAR                 128     0 No    
GRANTEETYPE                    SYSIBM    CHARACTER                 1     0 No    
TABSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
TABNAME                        SYSIBM    VARCHAR                 128     0 No    
AUTH_DESC                      SYSIBM    BLOB                2097152     0 No    

  5 record(s) selected.


describe table SYSIBM.SYSUSEROPTIONS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
SERVERNAME                     SYSIBM    VARCHAR                 128     0 No    
AUTHID                         SYSIBM    VARCHAR                 128     0 No    
OPTION                         SYSIBM    VARCHAR                 128     0 No    
SETTING                        SYSIBM    VARCHAR                 255     0 No    

  4 record(s) selected.


describe table SYSIBM.SYSVERSIONS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
VERSIONNUMBER                  SYSIBM    INTEGER                   4     0 No    
VERSION_TIMESTAMP              SYSIBM    TIMESTAMP                10     0 No    
AUTHID                         SYSIBM    VARCHAR                 128     0 No    

  3 record(s) selected.


describe table SYSIBM.SYSVIEWDEP

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
BNAME                          SYSIBM    VARCHAR                 128     0 No    
BCREATOR                       SYSIBM    VARCHAR                 128     0 No    
BTYPE                          SYSIBM    CHARACTER                 1     0 No    
DNAME                          SYSIBM    VARCHAR                 128     0 No    
DCREATOR                       SYSIBM    VARCHAR                 128     0 No    
VCAUTHID                       SYSIBM    VARCHAR                 128     0 Yes   
TABAUTH                        SYSIBM    SMALLINT                  2     0 Yes   
DTYPE                          SYSIBM    CHARACTER                 1     0 No    
OUTER_FROM                     SYSIBM    CHARACTER                 1     0 No    

  9 record(s) selected.


describe table SYSIBM.SYSVIEWS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
NAME                           SYSIBM    VARCHAR                 128     0 No    
CREATOR                        SYSIBM    VARCHAR                 128     0 No    
CHECK                          SYSIBM    CHARACTER                 1     0 No    
TEXT                           SYSIBM    CLOB                  65536     0 No    
FUNC_PATH                      SYSIBM    VARCHAR                 254     0 No    
VALID                          SYSIBM    CHARACTER                 1     0 No    
READONLY                       SYSIBM    CHARACTER                 1     0 No    
DEFINER                        SYSIBM    VARCHAR                 128     0 No    
QUALIFIER                      SYSIBM    VARCHAR                 128     0 No    

  9 record(s) selected.


describe table SYSIBM.SYSWRAPOPTIONS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
WRAPNAME                       SYSIBM    VARCHAR                 128     0 No    
OPTION                         SYSIBM    VARCHAR                 128     0 No    
SETTING                        SYSIBM    VARCHAR                 255     0 No    

  3 record(s) selected.


describe table SYSIBM.SYSWRAPPERS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
WRAPNAME                       SYSIBM    VARCHAR                 128     0 No    
WRAPTYPE                       SYSIBM    CHARACTER                 1     0 No    
WRAPVERSION                    SYSIBM    INTEGER                   4     0 No    
LIBRARY                        SYSIBM    VARCHAR                 255     0 No    
REMARKS                        SYSIBM    VARCHAR                 254     0 Yes   

  5 record(s) selected.


describe table SYSSTAT.COLDIST

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
TABSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
TABNAME                        SYSIBM    VARCHAR                 128     0 No    
COLNAME                        SYSIBM    VARCHAR                 128     0 No    
TYPE                           SYSIBM    CHARACTER                 1     0 No    
SEQNO                          SYSIBM    SMALLINT                  2     0 No    
COLVALUE                       SYSIBM    VARCHAR                 254     0 Yes   
VALCOUNT                       SYSIBM    BIGINT                    8     0 No    
DISTCOUNT                      SYSIBM    BIGINT                    8     0 Yes   

  8 record(s) selected.


describe table SYSSTAT.COLUMNS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
TABSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
TABNAME                        SYSIBM    VARCHAR                 128     0 No    
COLNAME                        SYSIBM    VARCHAR                 128     0 No    
COLCARD                        SYSIBM    BIGINT                    8     0 No    
HIGH2KEY                       SYSIBM    VARCHAR                 254     0 Yes   
LOW2KEY                        SYSIBM    VARCHAR                 254     0 Yes   
AVGCOLLEN                      SYSIBM    INTEGER                   4     0 No    
NUMNULLS                       SYSIBM    BIGINT                    8     0 No    

  8 record(s) selected.


describe table SYSSTAT.FUNCTIONS

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
FUNCSCHEMA                     SYSIBM    VARCHAR                 128     0 No    
FUNCNAME                       SYSIBM    VARCHAR                  18     0 No    
SPECIFICNAME                   SYSIBM    VARCHAR                  18     0 No    
IOS_PER_INVOC                  SYSIBM    DOUBLE                    8     0 No    
INSTS_PER_INVOC                SYSIBM    DOUBLE                    8     0 No    
IOS_PER_ARGBYTE                SYSIBM    DOUBLE                    8     0 No    
INSTS_PER_ARGBYTE              SYSIBM    DOUBLE                    8     0 No    
PERCENT_ARGBYTES               SYSIBM    SMALLINT                  2     0 No    
INITIAL_IOS                    SYSIBM    DOUBLE                    8     0 No    
INITIAL_INSTS                  SYSIBM    DOUBLE                    8     0 No    
CARDINALITY                    SYSIBM    BIGINT                    8     0 No    
SELECTIVITY                    SYSIBM    DOUBLE                    8     0 No    

  12 record(s) selected.


describe table SYSSTAT.INDEXES

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
INDSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
INDNAME                        SYSIBM    VARCHAR                  18     0 No    
TABSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
TABNAME                        SYSIBM    VARCHAR                 128     0 No    
COLNAMES                       SYSIBM    VARCHAR                 640     0 No    
NLEAF                          SYSIBM    INTEGER                   4     0 No    
NLEVELS                        SYSIBM    SMALLINT                  2     0 No    
FIRSTKEYCARD                   SYSIBM    BIGINT                    8     0 No    
FIRST2KEYCARD                  SYSIBM    BIGINT                    8     0 No    
FIRST3KEYCARD                  SYSIBM    BIGINT                    8     0 No    
FIRST4KEYCARD                  SYSIBM    BIGINT                    8     0 No    
FULLKEYCARD                    SYSIBM    BIGINT                    8     0 No    
CLUSTERRATIO                   SYSIBM    SMALLINT                  2     0 No    
CLUSTERFACTOR                  SYSIBM    DOUBLE                    8     0 No    
SEQUENTIAL_PAGES               SYSIBM    INTEGER                   4     0 No    
DENSITY                        SYSIBM    INTEGER                   4     0 No    
PAGE_FETCH_PAIRS               SYSIBM    VARCHAR                 254     0 No    

  17 record(s) selected.


describe table SYSSTAT.TABLES

Column                         Type      Type
name                           schema    name               Length   Scale Nulls
------------------------------ --------- ------------------ -------- ----- -----
TABSCHEMA                      SYSIBM    VARCHAR                 128     0 No    
TABNAME                        SYSIBM    VARCHAR                 128     0 No    
CARD                           SYSIBM    BIGINT                    8     0 No    
NPAGES                         SYSIBM    INTEGER                   4     0 No    
FPAGES                         SYSIBM    INTEGER                   4     0 No    
OVERFLOW                       SYSIBM    INTEGER                   4     0 No    

  6 record(s) selected.


