<cfscript>
    component name="CurrencyConversionList" output="false" hint="I define the properties and methods" {

        property name="error" type="ErrorData" display="error" required="no" hint="";
        property name="baseAmount" type="CurrencyType" display="baseAmount" required="yes" hint="";
        property name="currencyList" type="CurrencyList" display="currencyList" required="yes" hint="";

        public CurrencyConversionList function init(CurrencyType baseAmount="", CurrencyList currencyList="") hint="I initialize the component and return myself" output="false" {

            this.setBaseAmount(arguments.baseAmount);

            this.setCurrencyList(arguments.currencyList);

            return this;
        }

        public void function setError(ErrorData error) {
            this.error = arguments.error;
        }

        public ErrorData function getError() {
            return this.error;
        }

        public void function setBaseAmount(CurrencyType baseAmount) {
            this.baseAmount = arguments.baseAmount;
        }

        public CurrencyType function getBaseAmount() {
            return this.baseAmount;
        }

        public void function setCurrencyList(CurrencyList currencyList) {
            this.currencyList = arguments.currencyList;
        }

        public CurrencyList function getCurrencyList() {
            return this.currencyList;
        }

        public struct function getStruct() {
            local.struct = structNew();

            if(isDefined('this.error')) {
                local.struct["error"] = getError().getStruct();
            }

            if(isDefined('this.baseAmount')) {
                local.struct["baseAmount"] = getBaseAmount().getStruct();
            }

            if(isDefined('this.currencyList')) {
                local.struct["currencyList"] = getCurrencyList().getStruct();
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

                    if('#key#' eq 'baseAmount') {

                        var keyObj = createObject("component", 'CurrencyType');
                        this.setBaseAmount(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'currencyList') {

                        var keyObj = createObject("component", 'currencyList');
                        this.setCurrencyList(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'error') {
                        var keyObj = createObject("component", 'ErrorData');
                        this.setError(keyObj.deserialize(local.json[key]));
                    }
                }
            } else if(isArray(local.json)) {

                for(i = 1; i lte ArrayLen(local.json); i = i + 1) {

                    if(NOT isStruct(local.json[i])) {

                        this.setBaseAmount(local.json[i]);

                        this.setCurrencyList(local.json[i]);
                    }

                    if(isStruct(local.json[i])) {
                        for(key in local.json[i]) {

                            if('#key#' eq 'baseAmount') {

                                var keyObj = createObject("component", 'CurrencyType');
                                this.setbaseAmount(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'currencyList') {

                                var keyObj = createObject("component", 'currencyList');
                                this.setcurrencyList(keyObj.deserialize(local.json[i][key]));
                            }
                        }
                    }
                }
            }

            return this;
        }

    }
</cfscript>