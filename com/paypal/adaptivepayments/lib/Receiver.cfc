<cfscript>
    component name="Receiver" output="false" hint="I define the properties and methods" {

        property name="error" type="ErrorData" display="error" required="no" hint="";
        property name="amount" type="numeric" display="amount" required="yes" hint="";
        property name="email" type="string" display="email" required="no" hint="";
        property name="phone" type="PhoneNumberType" display="phone" required="no" hint="";
        property name="primary" type="boolean" display="primary" required="no" hint="";
        property name="invoiceId" type="string" display="invoiceId" required="no" hint="";
        property name="paymentType" type="string" display="paymentType" required="no" hint="";
        property name="paymentSubType" type="string" display="paymentSubType" required="no" hint="";
        property name="accountId" type="string" display="accountId" required="no" hint="";

        public Receiver function init(numeric amount="") hint="I initialize the component and return myself" output="false" {

            this.setAmount(arguments.amount);

            return this;
        }

        public void function setError(ErrorData error) {
            this.error = arguments.error;
        }

        public ErrorData function getError() {
            return this.error;
        }

        public void function setAmount(numeric amount) {
            this.amount = arguments.amount;
        }

        public numeric function getAmount() {
            return this.amount;
        }

        public void function setEmail(string email) {
            this.email = arguments.email;
        }

        public string function getEmail() {
            return this.email;
        }

        public void function setPhone(PhoneNumberType phone) {
            this.phone = arguments.phone;
        }

        public PhoneNumberType function getPhone() {
            return this.phone;
        }

        public void function setPrimary(boolean primary) {
            this.primary = arguments.primary;
        }

        public boolean function getPrimary() {
            return this.primary;
        }

        public void function setInvoiceId(string invoiceId) {
            this.invoiceId = arguments.invoiceId;
        }

        public string function getInvoiceId() {
            return this.invoiceId;
        }

        public void function setPaymentType(string paymentType) {
            this.paymentType = arguments.paymentType;
        }

        public string function getPaymentType() {
            return this.paymentType;
        }

        public void function setPaymentSubType(string paymentSubType) {
            this.paymentSubType = arguments.paymentSubType;
        }

        public string function getPaymentSubType() {
            return this.paymentSubType;
        }

        public void function setAccountId(string accountId) {
            this.accountId = arguments.accountId;
        }

        public string function getAccountId() {
            return this.accountId;
        }

        public struct function getStruct() {
            local.struct = structNew();

            if(isDefined('this.error')) {
                local.struct["error"] = getError().getStruct();
            }

            if(isDefined('this.amount')) {
                local.struct["amount"] = getAmount();
            }

            if(isDefined('this.email')) {
                local.struct["email"] = getEmail();
            }

            if(isDefined('this.phone')) {
                local.struct["phone"] = getPhone().getStruct();
            }

            if(isDefined('this.primary')) {
                local.struct["primary"] = getprimary();
            }

            if(isDefined('this.invoiceId')) {
                local.struct["invoiceId"] = getInvoiceId();
            }

            if(isDefined('this.paymentType')) {
                local.struct["paymentType"] = getPaymentType();
            }

            if(isDefined('this.paymentSubType')) {
                local.struct["paymentSubType"] = getPaymentSubType();
            }

            if(isDefined('this.accountId')) {
                local.struct["accountId"] = getAccountId();
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

                    if('#key#' eq 'amount') {
                        this.setAmount(local.json[key]);
                    }

                    if('#key#' eq 'email') {
                        this.setEmail(local.json[key]);
                    }

                    if('#key#' eq 'phone') {

                        var keyObj = createObject("component", 'phone');

                        this.setPhone(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'primary') {
                        this.setPrimary(local.json[key]);
                    }

                    if('#key#' eq 'invoiceId') {
                        this.setInvoiceId(local.json[key]);
                    }

                    if('#key#' eq 'paymentType') {
                        this.setPaymentType(local.json[key]);
                    }

                    if('#key#' eq 'paymentSubType') {
                        this.setPaymentSubType(local.json[key]);
                    }

                    if('#key#' eq 'accountId') {
                        this.setAccountId(local.json[key]);
                    }

                    if('#key#' eq 'error') {

                        var keyObj = createObject("component", 'ErrorData');

                        this.setError(keyObj.deserialize(local.json[key]));
                    }
                }
            } else if(isArray(local.json)) {

                for(i = 1; i lte ArrayLen(local.json); i = i + 1) {

                    if(NOT isStruct(local.json[i])) {

                        this.setAmount(local.json[i]);

                        this.setEmail(local.json[i]);

                        this.setPhone(local.json[i]);

                        this.setPrimary(local.json[i]);

                        this.setInvoiceId(local.json[i]);

                        this.setPaymentType(local.json[i]);

                        this.setPaymentSubType(local.json[i]);

                        this.setAccountId(local.json[i]);
                    }

                    if(isStruct(local.json[i])) {
                        for(key in local.json[i]) {

                            if('#key#' eq 'amount') {
                                this.setAmount(local.json[i][key]);
                            }

                            if('#key#' eq 'email') {
                                this.setEmail(local.json[i][key]);
                            }

                            if('#key#' eq 'phone') {

                                var keyObj = createObject("component", 'phone');

                                this.setPhone(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'primary') {
                                this.setPrimary(local.json[i][key]);
                            }

                            if('#key#' eq 'invoiceId') {
                                this.setInvoiceId(local.json[i][key]);
                            }

                            if('#key#' eq 'paymentType') {
                                this.setPaymentType(local.json[i][key]);
                            }

                            if('#key#' eq 'paymentSubType') {
                                this.setPaymentSubType(local.json[i][key]);
                            }

                            if('#key#' eq 'accountId') {
                                this.setAccountId(local.json[i][key]);
                            }
                        }
                    }
                }
            }

            return this;
        }

    }
</cfscript>