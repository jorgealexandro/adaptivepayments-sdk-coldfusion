<cfscript>
    component name="FundingPlan" output="false" hint="I define the properties and methods" {

        property name="error" type="ErrorData" display="error" required="no" hint="";
        property name="fundingPlanId" type="string" display="fundingPlanId" required="yes" hint="";
        property name="fundingAmount" type="CurrencyType" display="fundingAmount" required="yes" hint="";
        property name="backupFundingSource" type="FundingSource" display="backupFundingSource" required="no" hint="";
        property name="senderFees" type="CurrencyType" display="senderFees" required="no" hint="";
        property name="currencyConversion" type="CurrencyConversion" display="currencyConversion" required="no" hint="";
        property name="charge" type="FundingPlanCharge" display="charge" required="yes" hint="";

        variables.items = ArrayNew(1);

        public FundingPlan function init(string fundingPlanId="", CurrencyType fundingAmount="", FundingPlanCharge charge="") hint="I initialize the component and return myself" output="false" {

            this.setFundingPlanId(arguments.fundingPlanId);

            this.setFundingAmount(arguments.fundingAmount);

            this.setCharge(arguments.charge);

            addItem(arguments.charge);

            return this;
        }

        public void function setError(ErrorData error) {
            this.error = arguments.error;
        }

        public ErrorData function getError() {
            return this.error;
        }

        public void function setFundingPlanId(string fundingPlanId) {
            this.fundingPlanId = arguments.fundingPlanId;
        }

        public string function getFundingPlanId() {
            return this.fundingPlanId;
        }

        public void function setFundingAmount(CurrencyType fundingAmount) {
            this.fundingAmount = arguments.fundingAmount;
        }

        public CurrencyType function getFundingAmount() {
            return this.fundingAmount;
        }

        public void function setBackupFundingSource(FundingSource backupFundingSource) {
            this.backupFundingSource = arguments.backupFundingSource;
        }

        public FundingSource function getBackupFundingSource() {
            return this.backupFundingSource;
        }

        public void function setSenderFees(CurrencyType senderFees) {
            this.senderFees = arguments.senderFees;
        }

        public CurrencyType function getSenderFees() {
            return this.senderFees;
        }

        public void function setCurrencyConversion(CurrencyConversion currencyConversion) {
            this.currencyConversion = arguments.currencyConversion;
        }

        public CurrencyConversion function getCurrencyConversion() {
            return this.currencyConversion;
        }

        public void function setCharge(FundingPlanCharge charge) {
            this.charge = arguments.charge;
        }

        public FundingPlanCharge function getCharge() {
            return this.charge;
        }

        public any function addItem(FundingPlanCharge item) {
            if(Compare('FundingPlanCharge', 'string') eq 0) {
                ArrayAppend(variables.items, arguments.item);
            } else {
                ArrayAppend(variables.items, arguments.item.getStruct());
            }
        }

        public any function getItems() {
            return variables.items;
        }

        public any function clearItems() {
            variables.items = ArrayNew(1);
        }

        public struct function getStruct() {
            local.struct = structNew();

            if(isDefined('this.error')) {
                local.struct["error"] = getError().getStruct();
            }

            if(isDefined('this.fundingPlanId')) {
                local.struct["fundingPlanId"] = getFundingPlanId();
            }

            if(isDefined('this.fundingAmount')) {
                local.struct["fundingAmount"] = getFundingAmount().getStruct();
            }

            if(isDefined('this.backupFundingSource')) {
                local.struct["backupFundingSource"] = getBackupFundingSource().getStruct();
            }

            if(isDefined('this.senderFees')) {
                local.struct["senderFees"] = getSenderFees().getStruct();
            }

            if(isDefined('this.currencyConversion')) {
                local.struct["currencyConversion"] = getCurrencyConversion().getStruct();
            }

            if(isDefined('this.charge'))
                local.struct["charge"] = getItems();

            return local.struct;
        }

        public any function serialize() {
            return serializeJSON(this.getStruct());
        }

        public any function deserialize(any jsonObj) {
            if(isJSON(jsonObj)) {
                local.json = deserializeJSON(jsonObj);
            } else {
                local.json = jsonObj;
            }

            if(isStruct(local.json)) {

                for(key in local.json) {

                    if('#key#' eq 'fundingPlanId') {

                        this.setFundingPlanId(local.json[key]);
                    }

                    if('#key#' eq 'fundingAmount') {

                        var keyObj = createObject("component", 'fundingAmount');
                        this.setFundingAmount(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'backupFundingSource') {

                        var keyObj = createObject("component", 'backupFundingSource');
                        this.setBackupFundingSource(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'senderFees') {
                        var keyObj = createObject("component", 'senderFees');
                        this.setSenderFees(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'currencyConversion') {

                        var keyObj = createObject("component", 'currencyConversion');
                        this.setCurrencyConversion(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'charge') {

                        var keyObj = createObject("component", 'charge');
                        this.setCharge(keyObj.deserialize(local.json[key]));

                        this.addItem(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'error') {
                        var keyObj = createObject("component", 'ErrorData');
                        this.setError(keyObj.deserialize(local.json[key]));
                    }
                }
            } else if(isArray(local.json)) {

                for(i = 1; i lte ArrayLen(local.json); i = i + 1) {

                    if(NOT isStruct(local.json[i])) {

                        this.setFundingPlanId(local.json[i]);

                        this.setFundingAmount(local.json[i]);

                        this.setBackupFundingSource(local.json[i]);

                        this.setSenderFees(local.json[i]);

                        this.setCurrencyConversion(local.json[i]);

                        this.setCharge(local.json[i]);
                    }

                    if(isStruct(local.json[i])) {
                        for(key in local.json[i]) {

                            if('#key#' eq 'fundingPlanId') {

                                this.setFundingPlanId(local.json[i][key]);
                            }

                            if('#key#' eq 'fundingAmount') {

                                var keyObj = createObject("component", 'fundingAmount');
                                this.setFundingAmount(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'backupFundingSource') {

                                var keyObj = createObject("component", 'backupFundingSource');
                                this.setBackupFundingSource(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'senderFees') {
                                var keyObj = createObject("component", 'senderFees');
                                this.setSenderFees(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'currencyConversion') {

                                var keyObj = createObject("component", 'currencyConversion');
                                this.setCurrencyConversion(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'charge') {

                                var keyObj = createObject("component", 'charge');
                                this.setCharge(keyObj.deserialize(local.json[i][key]));

                                this.addItem(keyObj.deserialize(local.json[i][key]));
                            }
                        }
                    }
                }
            }

            return this;
        }

    }
</cfscript>