<cfscript>
    component name="CurrencyType" output="false" hint="I define the properties and methods" {

        property name="error" type="ErrorData" display="error" required="no" hint="";
        property name="code" type="string" display="code" required="yes" hint="";
        property name="amount" type="numeric" display="amount" required="yes" hint="";

        public CurrencyType function init(string code="", numeric amount="") hint="I initialize the component and return myself" output="false" {

            this.setCode(arguments.code);

            this.setAmount(arguments.amount);

            return this;
        }

        public void function setError(ErrorData error) {
            this.error = arguments.error;
        }

        public ErrorData function getError() {
            return this.error;
        }

        public void function setCode(string code) {
            this.code = arguments.code;
        }

        public string function getCode() {
            return this.code;
        }

        public void function setAmount(numeric amount) {
            this.amount = arguments.amount;
        }

        public numeric function getAmount() {
            return this.amount;
        }

        public struct function getStruct() {
            local.struct = structNew();

            if(isDefined('this.error')) {
                local.struct["error"] = getError().getStruct();
            }

            if(isDefined('this.code')) {
                local.struct["code"] = getCode();
            }

            if(isDefined('this.amount')) {
                local.struct["amount"] = getAmount();
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

                    if('#key#' eq 'code') {
                        this.setCode(local.json[key]);
                    }

                    if('#key#' eq 'amount') {
                        this.setAmount(local.json[key]);
                    }

                    if('#key#' eq 'error') {
                        var keyObj = createObject("component", 'ErrorData');
                        this.setError(keyObj.deserialize(local.json[key]));
                    }
                }
            } else if(isArray(local.json)) {

                for(i = 1; i lte ArrayLen(local.json); i = i + 1) {

                    if(NOT isStruct(local.json[i])) {

                        this.setcode(local.json[i]);

                        this.setamount(local.json[i]);
                    }

                    if(isStruct(local.json[i])) {
                        for(key in local.json[i]) {

                            if('#key#' eq 'code') {
                                this.setCode(local.json[i][key]);
                            }

                            if('#key#' eq 'amount') {
                                this.setAmount(local.json[i][key]);
                            }
                        }
                    }
                }
            }

            return this;
        }

    }
</cfscript>