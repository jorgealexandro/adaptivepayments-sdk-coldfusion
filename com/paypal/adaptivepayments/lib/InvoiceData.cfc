<cfscript>
    component name="InvoiceData" output="false" hint="I define the properties and methods" {

        property name="error" type="ErrorData" display="error" required="no" hint="";
        property name="item" type="InvoiceItem" display="item" required="no" hint="";
        property name="totalTax" type="numeric" display="totalTax" required="no" hint="";
        property name="totalShipping" type="numeric" display="totalShipping" required="no" hint="";

        variables.items = ArrayNew(1);

        public InvoiceData function init() hint="I initialize the component and return myself" output="false" {

            return this;
        }

        public void function setError(ErrorData error) {
            this.error = arguments.error;
        }

        public ErrorData function getError() {
            return this.error;
        }

        public void function setItem(InvoiceItem item) {
            this.item = arguments.item;
        }

        public InvoiceItem function getItem() {
            return this.item;
        }

        public any function addItem(InvoiceItem item) {
            if(Compare('InvoiceItem', 'string') eq 0) {
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

        public void function setTotalTax(numeric totalTax) {
            this.totalTax = arguments.totalTax;
        }

        public numeric function getTotalTax() {
            return this.totalTax;
        }

        public void function setTotalShipping(numeric totalShipping) {
            this.totalShipping = arguments.totalShipping;
        }

        public numeric function getTotalShipping() {
            return this.totalShipping;
        }

        public struct function getStruct() {
            local.struct = structNew();

            if(isDefined('this.error')) {
                local.struct["error"] = getError().getStruct();
            }

            if(isDefined('this.item')) {
                local.struct["item"] = getItems();
            }

            if(isDefined('this.totalTax')) {
                local.struct["totalTax"] = getTotalTax();
            }

            if(isDefined('this.totalShipping')) {
                local.struct["totalShipping"] = getTotalShipping();
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

                    if('#key#' eq 'item') {

                        var keyObj = createObject("component", 'item');

                        this.setItem(keyObj.deserialize(local.json[key]));
                        this.addItem(keyObj.deserialize(local.json[key]));
                    }

                    if('#key#' eq 'totalTax') {
                        this.setTotalTax(local.json[key]);
                    }

                    if('#key#' eq 'totalShipping') {
                        this.setTotalShipping(local.json[key]);
                    }

                    if('#key#' eq 'error') {
                        var keyObj = createObject("component", 'ErrorData');
                        this.setError(keyObj.deserialize(local.json[key]));
                    }
                }
            } else if(isArray(local.json)) {

                for(i = 1; i lte ArrayLen(local.json); i = i + 1) {

                    if(NOT isStruct(local.json[i])) {

                        this.setItem(local.json[i]);

                        this.setTotalTax(local.json[i]);

                        this.setTotalShipping(local.json[i]);
                    }

                    if(isStruct(local.json[i])) {
                        for(key in local.json[i]) {

                            if('#key#' eq 'item') {

                                var keyObj = createObject("component", 'item');

                                this.setitem(keyObj.deserialize(local.json[i][key]));
                                this.addItem(keyObj.deserialize(local.json[i][key]));
                            }

                            if('#key#' eq 'totalTax') {
                                this.setTotalTax(local.json[i][key]);
                            }

                            if('#key#' eq 'totalShipping') {
                                this.setTotalShipping(local.json[i][key]);
                            }
                        }
                    }
                }
            }

            return this;
        }

    }
</cfscript>