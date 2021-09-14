var App = function () {
    var handlerInitValidate = function () {
        $("#inputForm").validate({
            errorLabelContainer: $("#inputForm div.error input.alert")
        });
    };

    var handlerCustomValidate = function () {
        $.validator.addMethod("mobile", function (value, element) {
            var length = value.length;
            var mobile = /^(((13[0-9]{1})|(15[0-9]{1}))+\d[8])$/;
            return this.optional(element) || (length == 11 && mobile.test(value));
        }, "wrong number format");
    }

    return {
        init: function () {
            handlerCustomValidate();
            handlerInitValidate();
        }
    }
}();

$(document).ready(function () {
    App.init();
})