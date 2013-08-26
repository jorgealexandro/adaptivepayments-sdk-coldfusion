<cfscript>
    component name="GetUserLimitsRequest" output="false" hint="I define the properties and methods" {

        property name="error" type="ErrorData" display="error" required="no" hint="";
        property name="requestEnvelope" type="RequestEnvelope" display="requestEnvelope" required="yes" hint="";
        property name="user" type="AccountIdentifier" display="user" required="yes" hint="The account identifier for the user";
        property name="country" type="string" display="country" required="yes" hint="";
        property name="currencyCode" type="string" display="currencyCode" required="yes" hint="";
        property name="limitType" type="string" display="limitType" required="yes" hint="List of limit types";

        variables.items = ArrayNew(1);

        public GetUserLimitsRequest function init(RequestEnvelope requestEnvelope="", AccountIdentifier user="", string country="", string currencyCode="", string limitType="") hint="I initialize the component and return myself" output="false" {

            this.setRequestEnvelope(arguments.requestEnvelope);

            this.setUser(arguments.user);

            this.setCountry(arguments.country);

            this.setCurrencyCode(arguments.currencyCode);

            this.setLimitType(arguments.limitType);

            addItem(arguments.limitType);

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

        public void function setUser(AccountIdentifier user) {
            this.user = arguments.user;
        }

        public AccountIdentifier function getuser() {
            return this.user;
        }

        public void function setCountry(string country) {
            this.country = arguments.country;
        }

        public string function getCountry() {
            return this.country;
        }

        public void function setCurrencyCode(string currencyCode) {
            this.currencyCode = arguments.currencyCode;
        }

        public string function getCurrencyCode() {
            return this.currencyCode;
        }

        public void function setLimitType(string limitType) {
            this.limitType = arguments.limitType;
        }

        public string function getLimitType() {
            return this.limitType;
        }

        public any function addItem(string item) {
            if(Compare('string', 'string') eq 0) {
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

            if(isDefined('this.requestEnvelope')) {
                local.struct["requestEnvelope"] = getrequestEnvelope().getStruct();
            }

            if(isDefined('this.user')) {
                local.struct["user"] = getUser().getStruct();
            }

            if(isDefined('this.country')) {
                local.struct["country"] = getCountry();
            }

            if(isDefined('this.currencyCode')) {
                local.struct["currencyCode"] = getCurrencyCode();
            }

            if(isDefined('this.limitType')) {
                local.struct["limitType"] = getItems();
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

                    if('#key#' eq 'user') {

                        var keyObj = createObject("component", 'user');

                        this.setUser(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'country') {

                        this.setCountry(local.json[key]);
                    }

                    if('#key#' eq 'currencyCode') {

                        this.setCurrencyCode(local.json[key]);
                    }

                    if('#key#' eq 'limitType') {

                        this.setLimitType(local.json[key]);
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

                        this.setUser(local.json[i]);

                        this.setCountry(local.json[i]);

                        this.setCurrencyCode(local.json[i]);

                        this.setLimitType(local.json[i]);
                    }

                    if(isStruct(local.json[i])) {
                        for(key in local.json[i]) {

                            if('#key#' eq 'requestEnvelope') {

                                var keyObj = createObject("component", 'requestEnvelope');
                                this.setRequestEnvelope(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'user') {

                                var keyObj = createObject("component", 'user');
                                this.setUser(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'country') {

                                this.setCountry(local.json[i][key]);
                            }

                            if('#key#' eq 'currencyCode') {

                                this.setCurrencyCode(local.json[i][key]);
                            }

                            if('#key#' eq 'limitType') {

                                this.setLimitType(local.json[i][key]);
                            }
                        }
                    }
                }
            }

            return this;
        }

    }
</cfscript>