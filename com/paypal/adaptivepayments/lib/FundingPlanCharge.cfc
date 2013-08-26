<cfscript>
    component name="FundingPlanCharge" output="false" hint="I define the properties and methods" {

        property name="error" type="ErrorData" display="error" required="no" hint="";
        property name="charge" type="CurrencyType" display="charge" required="yes" hint="";
        property name="fundingSource" type="FundingSource" display="fundingSource" required="yes" hint="";

        public FundingPlanCharge function init(CurrencyType charge="", FundingSource fundingSource="") hint="I initialize the component and return myself" output="false" {

            this.setcharge(arguments.charge);

            this.setfundingSource(arguments.fundingSource);

            return this;
        }

        public void function setError(ErrorData error) {
            this.error = arguments.error;
        }

        public ErrorData function getError() {
            return this.error;
        }

        public void function setCharge(CurrencyType charge) {
            this.charge = arguments.charge;
        }

        public CurrencyType function getCharge() {
            return this.charge;
        }

        public void function setFundingSource(FundingSource fundingSource) {
            this.fundingSource = arguments.fundingSource;
        }

        public FundingSource function getFundingSource() {
            return this.fundingSource;
        }

        public struct function getStruct() {
            local.struct = structNew();

            if(isDefined('this.error')) {
                local.struct["error"] = getError().getStruct();
            }

            if(isDefined('this.charge')) {
                local.struct["charge"] = getCharge().getStruct();
            }

            if(isDefined('this.fundingSource')) {
                local.struct["fundingSource"] = getFundingSource().getStruct();
            }

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

                    if('#key#' eq 'charge') {

                        var keyObj = createObject("component", 'charge');
                        this.setCharge(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'fundingSource') {

                        var keyObj = createObject("component", 'fundingSource');
                        this.setFundingSource(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'error') {
                        var keyObj = createObject("component", 'ErrorData');
                        this.setError(keyObj.deserialize(local.json[key]));
                    }
                }
            } else if(isArray(local.json)) {

                for(i = 1; i lte ArrayLen(local.json); i = i + 1) {

                    if(NOT isStruct(local.json[i])) {

                        this.setCharge(local.json[i]);

                        this.setFundingSource(local.json[i]);
                    }

                    if(isStruct(local.json[i])) {
                        for(key in local.json[i]) {

                            if('#key#' eq 'charge') {

                                var keyObj = createObject("component", 'charge');
                                this.setCharge(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'fundingSource') {

                                var keyObj = createObject("component", 'fundingSource');
                                this.setFundingSource(keyObj.deserialize(local.json[i][key]));
                            }
                        }
                    }
                }
            }

            return this;
        }

    }
</cfscript>