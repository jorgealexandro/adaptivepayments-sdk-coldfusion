<cfscript>
    component name="CurrencyConversion" output="false" hint="I define the properties and methods" {

        property name="error" type="ErrorData" display="error" required="no" hint="";
        property name="from" type="CurrencyType" display="from" required="yes" hint="";
        property name="to" type="CurrencyType" display="to" required="yes" hint="";
        property name="exchangeRate" type="numeric" display="exchangeRate" required="yes" hint="";

        public CurrencyConversion function init(CurrencyType from="", CurrencyType to="", numeric exchangeRate="") hint="I initialize the component and return myself" output="false" {

            this.setfrom(arguments.from);

            this.setto(arguments.to);

            this.setexchangeRate(arguments.exchangeRate);

            return this;
        }

        public void function setError(ErrorData error) {
            this.error = arguments.error;
        }

        public ErrorData function getError() {
            return this.error;
        }

        public void function setFrom(CurrencyType from) {
            this.from = arguments.from;
        }

        public CurrencyType function getFrom() {
            return this.from;
        }

        public void function setTo(CurrencyType to) {
            this.to = arguments.to;
        }

        public CurrencyType function getTo() {
            return this.to;
        }

        public void function setExchangeRate(numeric exchangeRate) {
            this.exchangeRate = arguments.exchangeRate;
        }

        public numeric function getExchangeRate() {
            return this.exchangeRate;
        }

        public struct function getStruct() {
            local.struct = structNew();

            if(isDefined('this.error')) {
                local.struct["error"] = getError().getStruct();
            }

            if(isDefined('this.from')) {
                local.struct["from"] = getFrom().getStruct();
            }

            if(isDefined('this.to')) {
                local.struct["to"] = getTo().getStruct();
            }

            if(isDefined('this.exchangeRate')) {
                local.struct["exchangeRate"] = getExchangeRate();
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

                    if('#key#' eq 'from') {

                        var keyObj = createObject("component", 'from');
                        this.setfrom(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'to') {

                        var keyObj = createObject("component", 'to');
                        this.setto(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'exchangeRate') {
                        this.setExchangeRate(local.json[key]);
                    }

                    if('#key#' eq 'error') {
                        var keyObj = createObject("component", 'ErrorData');
                        this.setError(keyObj.deserialize(local.json[key]));
                    }
                }
            } else if(isArray(local.json)) {

                for(i = 1; i lte ArrayLen(local.json); i = i + 1) {

                    if(NOT isStruct(local.json[i])) {

                        this.setfrom(local.json[i]);

                        this.setto(local.json[i]);

                        this.setexchangeRate(local.json[i]);
                    }

                    if(isStruct(local.json[i])) {
                        for(key in local.json[i]) {

                            if('#key#' eq 'from') {

                                var keyObj = createObject("component", 'from');

                                this.setFrom(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'to') {

                                var keyObj = createObject("component", 'to');

                                this.setTo(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'exchangeRate') {

                                this.setExchangeRate(local.json[i][key]);
                            }
                        }
                    }
                }
            }

            return this;
        }

    }
</cfscript>