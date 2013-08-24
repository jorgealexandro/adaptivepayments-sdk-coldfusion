<cfscript>
    component name="ConvertCurrencyRequest" output="false" hint="I define the properties and methods" {

        property name="error" type="ErrorData" display="error" required="no" hint="";
        property name="requestEnvelope" type="RequestEnvelope" display="requestEnvelope" required="yes" hint="";
        property name="baseAmountList" type="CurrencyList" display="baseAmountList" required="yes" hint="";
        property name="convertToCurrencyList" type="CurrencyCodeList" display="convertToCurrencyList" required="yes" hint="";
        property name="countryCode" type="string" display="countryCode" required="no" hint="The two-character ISO country code where fx suppposed to happen";
        property name="conversionType" type="string" display="conversionType" required="no" hint="";

        public ConvertCurrencyRequest function init(RequestEnvelope requestEnvelope="", CurrencyList baseAmountList="", CurrencyCodeList convertToCurrencyList="") hint="I initialize the component and return myself" output="false" {

            this.setRequestEnvelope(arguments.requestEnvelope);

            this.setBaseAmountList(arguments.baseAmountList);

            this.setConvertToCurrencyList(arguments.convertToCurrencyList);

            return this;
        }

        public void function setError(ErrorData error) {
            this.error = arguments.error;
        }

        public ErrorData function getError() {
            return this.error;
        }

        public void function setRequestEnvelope(RequestEnvelope requestEnvelope) {
            this.requestEnvelope = arguments.requestEnvelope;
        }

        public RequestEnvelope function getRequestEnvelope() {
            return this.requestEnvelope;
        }

        public void function setBaseAmountList(CurrencyList baseAmountList) {
            this.baseAmountList = arguments.baseAmountList;
        }

        public CurrencyList function getBaseAmountList() {
            return this.baseAmountList;
        }

        public void function setConvertToCurrencyList(CurrencyCodeList convertToCurrencyList) {
            this.convertToCurrencyList = arguments.convertToCurrencyList;
        }

        public CurrencyCodeList function getConvertToCurrencyList() {
            return this.convertToCurrencyList;
        }

        public void function setCountryCode(string countryCode) {
            this.countryCode = arguments.countryCode;
        }

        public string function getCountryCode() {
            return this.countryCode;
        }

        public void function setConversionType(string conversionType) {
            this.conversionType = arguments.conversionType;
        }

        public string function getConversionType() {
            return this.conversionType;
        }

        public struct function getStruct() {
            local.struct = structNew();

            if(isDefined('this.error')) {
                local.struct["error"] = getError().getStruct();
            }

            if(isDefined('this.requestEnvelope')) {
                local.struct["requestEnvelope"] = getRequestEnvelope().getStruct();
            }

            if(isDefined('this.baseAmountList')) {
                local.struct["baseAmountList"] = getBaseAmountList().getStruct();
            }

            if(isDefined('this.convertToCurrencyList')) {
                local.struct["convertToCurrencyList"] = getConvertToCurrencyList().getStruct();
            }

            if(isDefined('this.countryCode')) {
                local.struct["countryCode"] = getCountryCode();
            }

            if(isDefined('this.conversionType')) {
                local.struct["conversionType"] = getConversionType();
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

                    if('#key#' eq 'requestEnvelope') {

                        var keyObj = createObject("component", 'requestEnvelope');

                        this.setRequestEnvelope(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'baseAmountList') {

                        var keyObj = createObject("component", 'baseAmountList');

                        this.setBaseAmountList(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'convertToCurrencyList') {

                        var keyObj = createObject("component", 'convertToCurrencyList');

                        this.setConvertToCurrencyList(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'countryCode') {
                        this.setCountryCode(local.json[key]);
                    }

                    if('#key#' eq 'conversionType') {
                        this.setConversionType(local.json[key]);
                    }

                    if('#key#' eq 'error') {
                        var keyObj = createObject("component", 'ErrorData');
                        this.setError(keyObj.deserialize(local.json[key]));
                    }
                }
            } else if(isArray(local.json)) {

                for(i = 1; i lte ArrayLen(local.json); i = i + 1) {

                    if(NOT isStruct(local.json[i])) {

                        this.setRequestEnvelope(local.json[i]);

                        this.setBaseAmountList(local.json[i]);

                        this.setConvertToCurrencyList(local.json[i]);

                        this.setCountryCode(local.json[i]);

                        this.setConversionType(local.json[i]);
                    }

                    if(isStruct(local.json[i])) {
                        for(key in local.json[i]) {

                            if('#key#' eq 'requestEnvelope') {

                                var keyObj = createObject("component", 'requestEnvelope');

                                this.setRequestEnvelope(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'baseAmountList') {

                                var keyObj = createObject("component", 'baseAmountList');

                                this.setBaseAmountList(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'convertToCurrencyList') {

                                var keyObj = createObject("component", 'convertToCurrencyList');

                                this.setConvertToCurrencyList(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'countryCode') {
                                this.setCountryCode(local.json[i][key]);
                            }

                            if('#key#' eq 'conversionType') {
                                this.setConversionType(local.json[i][key]);
                            }
                        }
                    }
                }
            }

            return this;
        }

    }
</cfscript>