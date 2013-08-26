<cfscript>
    component name="ExecutePaymentResponse" output="false" hint="I define the properties and methods" {

        property name="error" type="ErrorData" display="error" required="no" hint="";
        property name="responseEnvelope" type="ResponseEnvelope" display="responseEnvelope" required="yes" hint="";
        property name="paymentExecStatus" type="string" display="paymentExecStatus" required="yes" hint="";
        property name="payErrorList" type="PayErrorList" display="payErrorList" required="no" hint="";
        property name="postPaymentDisclosureList" type="PostPaymentDisclosureList" display="postPaymentDisclosureList" required="no" hint="";

        public ExecutePaymentResponse function init(ResponseEnvelope responseEnvelope="", string paymentExecStatus="") hint="I initialize the component and return myself" output="false" {

            this.setResponseEnvelope(arguments.responseEnvelope);

            this.setPaymentExecStatus(arguments.paymentExecStatus);

            return this;
        }

        public void function setError(ErrorData error) {
            this.error = arguments.error;
        }

        public ErrorData function getError() {
            return this.error;
        }

        public void function setResponseEnvelope(ResponseEnvelope responseEnvelope) {
            this.responseEnvelope = arguments.responseEnvelope;
        }

        public ResponseEnvelope function getResponseEnvelope() {
            return this.responseEnvelope;
        }

        public void function setPaymentExecStatus(string paymentExecStatus) {
            this.paymentExecStatus = arguments.paymentExecStatus;
        }

        public string function getPaymentExecStatus() {
            return this.paymentExecStatus;
        }

        public void function setPayErrorList(PayErrorList payErrorList) {
            this.payErrorList = arguments.payErrorList;
        }

        public PayErrorList function getPayErrorList() {
            return this.payErrorList;
        }

        public void function setPostPaymentDisclosureList(PostPaymentDisclosureList postPaymentDisclosureList) {
            this.postPaymentDisclosureList = arguments.postPaymentDisclosureList;
        }

        public PostPaymentDisclosureList function getPostPaymentDisclosureList() {
            return this.postPaymentDisclosureList;
        }

        public struct function getStruct() {
            local.struct = structNew();

            if(isDefined('this.error')) {
                local.struct["error"] = getError().getStruct();
            }

            if(isDefined('this.responseEnvelope')) {
                local.struct["responseEnvelope"] = getResponseEnvelope().getStruct();
            }

            if(isDefined('this.paymentExecStatus')) {
                local.struct["paymentExecStatus"] = getPaymentExecStatus();
            }

            if(isDefined('this.payErrorList')) {
                local.struct["payErrorList"] = getPayErrorList().getStruct();
            }

            if(isDefined('this.postPaymentDisclosureList')) {
                local.struct["postPaymentDisclosureList"] = getPostPaymentDisclosureList().getStruct();
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

                    if('#key#' eq 'responseEnvelope') {
                        var keyObj = createObject("component", 'responseEnvelope');
                        this.setResponseEnvelope(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'paymentExecStatus') {
                        this.setPaymentExecStatus(local.json[key]);
                    }

                    if('#key#' eq 'error') {

                        errorStruct = StructNew();
                        errorStruct['payError'] = local.json[key];
                        local.json[key] = errorStruct;

                        var keyObj = createObject("component", 'payErrorList');
                        this.setPayErrorList(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'postPaymentDisclosureList') {

                        var keyObj = createObject("component", 'postPaymentDisclosureList');
                        this.setPostPaymentDisclosureList(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'error') {
                        var keyObj = createObject("component", 'ErrorData');
                        this.setError(keyObj.deserialize(local.json[key]));
                    }
                }
            } else if(isArray(local.json)) {

                for(i = 1; i lte ArrayLen(local.json); i = i + 1) {

                    if(NOT isStruct(local.json[i])) {

                        this.setResponseEnvelope(local.json[i]);

                        this.setPaymentExecStatus(local.json[i]);

                        this.setPayErrorList(local.json[i]);

                        this.setPostPaymentDisclosureList(local.json[i]);
                    }

                    if(isStruct(local.json[i])) {
                        for(key in local.json[i]) {

                            if('#key#' eq 'responseEnvelope') {

                                var keyObj = createObject("component", 'responseEnvelope');
                                this.setResponseEnvelope(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'paymentExecStatus') {

                                this.setPaymentExecStatus(local.json[i][key]);
                            }

                            if('#key#' eq 'error') {

                                var keyObj = createObject("component", 'error');
                                this.setpayErrorList(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'postPaymentDisclosureList') {

                                var keyObj = createObject("component", 'postPaymentDisclosureList');
                                this.setpostPaymentDisclosureList(keyObj.deserialize(local.json[i][key]));
                            }
                        }
                    }
                }
            }

            return this;
        }

    }
</cfscript>