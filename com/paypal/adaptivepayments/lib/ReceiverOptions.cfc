<cfscript>
    component name="ReceiverOptions" output="false" hint="I define the properties and methods" {

        property name="error" type="ErrorData" display="error" required="no" hint="";
        property name="description" type="string" display="description" required="no" hint="";
        property name="customId" type="string" display="customId" required="no" hint="";
        property name="invoiceData" type="InvoiceData" display="invoiceData" required="no" hint="";
        property name="receiver" type="AccountIdentifier" display="receiver" required="yes" hint="";
        property name="referrerCode" type="string" display="referrerCode" required="no" hint="";

        public ReceiverOptions function init(AccountIdentifier receiver="") hint="I initialize the component and return myself" output="false" {

            this.setreceiver(arguments.receiver);

            return this;
        }

        public void function setError(ErrorData error) {
            this.error = arguments.error;
        }

        public ErrorData function getError() {
            return this.error;
        }

        public void function setDescription(string description) {
            this.description = arguments.description;
        }

        public string function getDescription() {
            return this.description;
        }

        public void function setCustomId(string customId) {
            this.customId = arguments.customId;
        }

        public string function getCustomId() {
            return this.customId;
        }

        public void function setInvoiceData(InvoiceData invoiceData) {
            this.invoiceData = arguments.invoiceData;
        }

        public InvoiceData function getInvoiceData() {
            return this.invoiceData;
        }

        public void function setReceiver(AccountIdentifier receiver) {
            this.receiver = arguments.receiver;
        }

        public AccountIdentifier function getReceiver() {
            return this.receiver;
        }

        public void function setReferrerCode(string referrerCode) {
            this.referrerCode = arguments.referrerCode;
        }

        public string function getReferrerCode() {
            return this.referrerCode;
        }

        public struct function getStruct() {
            local.struct = structNew();

            if(isDefined('this.error')) {
                local.struct["error"] = getError().getStruct();
            }

            if(isDefined('this.description')) {
                local.struct["description"] = getDescription();
            }

            if(isDefined('this.customId')) {
                local.struct["customId"] = getCustomId();
            }

            if(isDefined('this.invoiceData')) {
                local.struct["invoiceData"] = getInvoiceData().getStruct();
            }

            if(isDefined('this.receiver')) {
                local.struct["receiver"] = getReceiver().getStruct();
            }

            if(isDefined('this.referrerCode')) {
                local.struct["referrerCode"] = getReferrerCode();
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

                    if('#key#' eq 'description') {
                        this.setDescription(local.json[key]);
                    }

                    if('#key#' eq 'customId') {
                        this.setCustomId(local.json[key]);
                    }

                    if('#key#' eq 'invoiceData') {

                        var keyObj = createObject("component", 'invoiceData');

                        this.setInvoiceData(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'receiver') {

                        var keyObj = createObject("component", 'receiver');

                        this.setReceiver(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'referrerCode') {
                        this.setReferrerCode(local.json[key]);
                    }

                    if('#key#' eq 'error') {

                        var keyObj = createObject("component", 'ErrorData');

                        this.setError(keyObj.deserialize(local.json[key]));
                    }
                }
            } else if(isArray(local.json)) {

                for(i = 1; i lte ArrayLen(local.json); i = i + 1) {

                    if(NOT isStruct(local.json[i])) {

                        this.setDescription(local.json[i]);

                        this.setCustomId(local.json[i]);

                        this.setInvoiceData(local.json[i]);

                        this.setReceiver(local.json[i]);

                        this.setReferrerCode(local.json[i]);
                    }

                    if(isStruct(local.json[i])) {
                        for(key in local.json[i]) {

                            if('#key#' eq 'description') {
                                this.setDescription(local.json[i][key]);
                            }

                            if('#key#' eq 'customId') {
                                this.setCustomId(local.json[i][key]);
                            }

                            if('#key#' eq 'invoiceData') {

                                var keyObj = createObject("component", 'invoiceData');

                                this.setInvoiceData(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'receiver') {

                                var keyObj = createObject("component", 'receiver');

                                this.setReceiver(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'referrerCode') {
                                this.setReferrerCode(local.json[i][key]);
                            }
                        }
                    }
                }
            }

            return this;
        }

    }
</cfscript>