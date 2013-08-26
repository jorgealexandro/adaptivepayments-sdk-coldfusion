<cfscript>
    component name="InvoiceItem" output="false" hint="I define the properties and methods" {

        property name="error" type="ErrorData" display="error" required="no" hint="";
        property name="name" type="string" display="name" required="no" hint="";
        property name="identifier" type="string" display="identifier" required="no" hint="";
        property name="price" type="numeric" display="price" required="no" hint="";
        property name="itemPrice" type="numeric" display="itemPrice" required="no" hint="";
        property name="itemCount" type="numeric" display="itemCount" required="no" hint="";

        public InvoiceItem function init() hint="I initialize the component and return myself" output="false" {

            return this;
        }

        public void function setError(ErrorData error) {
            this.error = arguments.error;
        }

        public ErrorData function getError() {
            return this.error;
        }

        public void function setName(string name) {
            this.name = arguments.name;
        }

        public string function getName() {
            return this.name;
        }

        public void function setIdentifier(string identifier) {
            this.identifier = arguments.identifier;
        }

        public string function getIdentifier() {
            return this.identifier;
        }

        public void function setPrice(numeric price) {
            this.price = arguments.price;
        }

        public numeric function getPrice() {
            return this.price;
        }

        public void function setItemPrice(numeric itemPrice) {
            this.itemPrice = arguments.itemPrice;
        }

        public numeric function getItemPrice() {
            return this.itemPrice;
        }

        public void function setItemCount(numeric itemCount) {
            this.itemCount = arguments.itemCount;
        }

        public numeric function getItemCount() {
            return this.itemCount;
        }

        public struct function getStruct() {
            local.struct = structNew();

            if(isDefined('this.error')) {
                local.struct["error"] = getError().getStruct();
            }

            if(isDefined('this.name')) {
                local.struct["name"] = getName();
            }

            if(isDefined('this.identifier')) {
                local.struct["identifier"] = getIdentifier();
            }

            if(isDefined('this.price')) {
                local.struct["price"] = getPrice();
            }

            if(isDefined('this.itemPrice')) {
                local.struct["itemPrice"] = getItemPrice();
            }

            if(isDefined('this.itemCount')) {
                local.struct["itemCount"] = getItemCount();
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

                    if('#key#' eq 'name') {
                        this.setName(local.json[key]);
                    }

                    if('#key#' eq 'identifier') {
                        this.setIdentifier(local.json[key]);
                    }

                    if('#key#' eq 'price') {
                        this.setPrice(local.json[key]);
                    }

                    if('#key#' eq 'itemPrice') {
                        this.setItemPrice(local.json[key]);
                    }

                    if('#key#' eq 'itemCount') {
                        this.setItemCount(local.json[key]);
                    }

                    if('#key#' eq 'error') {
                        var keyObj = createObject("component", 'ErrorData');
                        this.setError(keyObj.deserialize(local.json[key]));
                    }
                }
            } else if(isArray(local.json)) {

                for(i = 1; i lte ArrayLen(local.json); i = i + 1) {

                    if(NOT isStruct(local.json[i])) {

                        this.setName(local.json[i]);

                        this.setIdentifier(local.json[i]);

                        this.setPrice(local.json[i]);

                        this.setItemPrice(local.json[i]);

                        this.setItemCount(local.json[i]);
                    }

                    if(isStruct(local.json[i])) {
                        for(key in local.json[i]) {

                            if('#key#' eq 'name') {
                                this.setName(local.json[i][key]);
                            }

                            if('#key#' eq 'identifier') {
                                this.setIdentifier(local.json[i][key]);
                            }

                            if('#key#' eq 'price') {
                                this.setPrice(local.json[i][key]);
                            }

                            if('#key#' eq 'itemPrice') {
                                this.setItemPrice(local.json[i][key]);
                            }

                            if('#key#' eq 'itemCount') {
                                this.setItemCount(local.json[i][key]);
                            }
                        }
                    }
                }
            }

            return this;
        }

    }
</cfscript>