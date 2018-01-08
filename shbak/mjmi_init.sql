-- cb_supp_mjmiacctacctrole

-- cb_supp_mjmiacctappl

-- cb_supp_mjmiacctbalcattyp
INSERT INTO `cb_supp_mjmiacctbalcattyp` (`branchnbr`, `mjaccttypcd`, `miaccttypcd`, `balcatcd`, `baltypcd`, `mjmibalcattypdesc`, `gleffectnbr`, `reqdyn`, `depseqnbr`, `wthseqnbr`, `ddepseqnbr`, `dwthseqnbr`, `mainttellerid`, `maintbranchnbr`, `gmt_create`, `gmt_modified`, `paymentseqnbr`, `npfmpaymentseqnbr`, `excesspaymentsseqnbr`, `oddfreqallowedyn`, `pmtpercent`) VALUES ('00000001','DQS','1002','NOTE','BAL','本金余额',-1,1,0,0,0,0,NULL,NULL,'2017-07-29 11:10:12.445339','2017-07-29 11:10:12.445339',NULL,NULL,NULL,NULL,NULL);

-- cb_supp_mjmiacctgl
INSERT INTO `cb_supp_mjmiacctgl` (`branchnbr`, `mjaccttypcd`, `miaccttypcd`, `balcatcd`, `baltypcd`, `gleffectnbr`, `effdate`, `glaccttitlenbr`, `inactivedate`, `mainttellerid`, `maintbranchnbr`, `gmt_create`, `gmt_modified`) VALUES ('00000001','DQS','1002','NOTE','BAL',-1,'2017-01-01',2838,NULL,NULL,NULL,'2017-07-28 18:07:40.000000','2017-07-28 18:07:40.000000');

-- cb_supp_mjmiacctbranch

-- cb_supp_mjmiacctcalcvarinfo

-- cb_supp_mjmiacctctrlhist

-- cb_supp_mjmiacctgenrtxn

-- cb_supp_mjmiacctinthist

-- cb_supp_mjmiacctintrule

-- cb_supp_mjmiacctrtxngrplimit

-- cb_supp_mjmiacctrtxnlimit

-- cb_supp_mjmiacctrtxntyp
INSERT INTO `cb_supp_mjmiacctrtxntyp` (`branchnbr`, `mjaccttypcd`, `miaccttypcd`, `rtxntypcd`, `effdate`, `glaccttitlenbr`, `inactivedate`, `mainttellerid`, `maintbranchnbr`, `gmt_create`, `gmt_modified`) VALUES ('00000001','DQS','1002','IAD','2017-01-01',2864,NULL,NULL,NULL,'2017-09-16 23:04:14.000000','2017-09-16 23:04:14.000000');
INSERT INTO `cb_supp_mjmiacctrtxntyp` (`branchnbr`, `mjaccttypcd`, `miaccttypcd`, `rtxntypcd`, `effdate`, `glaccttitlenbr`, `inactivedate`, `mainttellerid`, `maintbranchnbr`, `gmt_create`, `gmt_modified`) VALUES ('00000001','DQS','1002','IAW','2017-01-01',2864,NULL,NULL,NULL,'2017-09-16 23:04:14.000000','2017-09-16 23:04:14.000000');
INSERT INTO `cb_supp_mjmiacctrtxntyp` (`branchnbr`, `mjaccttypcd`, `miaccttypcd`, `rtxntypcd`, `effdate`, `glaccttitlenbr`, `inactivedate`, `mainttellerid`, `maintbranchnbr`, `gmt_create`, `gmt_modified`) VALUES ('00000001','DQS','1002','ZJHC','2017-01-01',2860,NULL,NULL,NULL,'2017-09-16 16:28:07.000000','2017-09-16 16:28:10.000000');
INSERT INTO `cb_supp_mjmiacctrtxntyp` (`branchnbr`, `mjaccttypcd`, `miaccttypcd`, `rtxntypcd`, `effdate`, `glaccttitlenbr`, `inactivedate`, `mainttellerid`, `maintbranchnbr`, `gmt_create`, `gmt_modified`) VALUES ('00000001','DQS','1002','ZJHR','2017-01-01',2860,NULL,NULL,NULL,'2017-09-29 10:27:40.352563','2017-09-29 10:27:40.352563');

-- cb_supp_mjmiacctrtxntypprop

-- cb_supp_mjmiacctstattrf

-- cb_supp_mjmiaccttyp
INSERT INTO `cb_supp_mjmiaccttyp` (`branchnbr`, `mjaccttypcd`, `miaccttypcd`, `miaccttypname`, `miaccttypdesc`, `mjmiid`, `currencycd`, `effdate`, `inactivedate`, `displayseqnbr`, `mainttellerid`, `maintbranchnbr`, `gmt_create`, `gmt_modified`, `minbalamt`, `maxbalamt`) VALUES ('00000001','DQS','1002','贷款放款待清算','贷款放款待清算','H00001','156','2017-01-01',NULL,1,NULL,NULL,'2017-07-29 11:42:25.271880','2017-07-29 11:42:25.271880',NULL,NULL);

-- cb_supp_mjmiaccttypbribery

-- cb_supp_mjmiaccttypcc

-- cb_supp_mjmiaccttypccchrg

-- cb_supp_mjmiaccttypccterm

-- cb_supp_mjmiaccttypdep
INSERT INTO `cb_supp_mjmiaccttypdep` (`branchnbr`, `mjaccttypcd`, `miaccttypcd`, `termunitcd`, `termunitvalue`, `termminvalue`, `termmaxvalue`, `agreementvalue`, `agreementminvalue`, `agreementmaxvalue`, `minbalamt`, `maxbalamt`, `mindepamt`, `minwthamt`, `startamt`, `startminamt`, `startmaxamt`, `overdraftyn`, `overdraftminamt`, `overdraftmaxamt`, `overdrafttermunitcd`, `intfptervalue`, `overdrafttermvalue`, `gracedays`, `overdraftamtpricecd`, `intyn`, `taxyn`, `acctaudityn`, `tranyn`, `conveyanceyn`, `applybranchyn`, `isempyn`, `payintmethcd`, `datematdealtypcd`, `datematgracedays`, `datematgraceintyn`, `autotranferyn`, `transfertypcd`, `transferamttypcd`, `rnewmiaccttypcd`, `validyn`, `schedulepricecd`, `maxcount`, `mainttellerid`, `maintbranchnbr`, `gmt_create`, `gmt_modified`, `agreementcd`, `virtualyn`) VALUES ('00000001','DQS','1002',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,'2017-07-29 11:57:33.477700','2017-07-29 11:57:33.477700',NULL,0);

-- cb_supp_mjmiaccttypintegral

-- cb_supp_mjmiaccttypitl
INSERT INTO `cb_supp_mjmiaccttypitl` (`branchnbr`, `mjaccttypcd`, `miaccttypcd`, `miaccttypdesc`, `chargeoffyn`, `amtdirectioncd`, `currencycd`, `mjmigltypcd`, `allowitlacctyn`, `accounttypecd`, `writeoffyn`, `mainttellerid`, `maintbranchnbr`, `gmt_create`, `gmt_modified`) VALUES ('00000001','DQS','1002','贷款放款待清算',1,'CR','156','M',1,'ABLY',1,NULL,NULL,'2017-07-29 12:00:54.231743','2017-07-29 12:00:54.231743');

-- cb_supp_mjmiaccttyploan

-- cb_supp_mjmiaccttypofferhist

-- cb_supp_mjmiacctuserfield

-- cb_supp_mjmiacctvalrule

-- cb_supp_mjmiacctvouchtyp

-- cb_supp_mjmibalcalcvarinfo

-- cb_supp_mjmibalcatcalcvar

-- cb_supp_mjmifeerate

-- cb_supp_mjmioverdraftrulehist

-- cb_supp_mjmipmtsched

-- cb_supp_platform

