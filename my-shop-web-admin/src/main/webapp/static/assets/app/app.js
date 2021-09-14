var Zoo = function () {

    let _masterCheckbox;
    let _sonCheckbox;



    var handlePageFunction = function (url, column) {
        var _datatable = $("#data_table").DataTable({
            searching: false,
            ordering: false,
            lengthChange: false,
            info: false,
            paging: true,
            processing: true,
            // scrollY: false,
            serverSide: true,
            stateSave: true,
            deferRender: true,
            ajax: {
                "url": url
            },
            drawCallback: function (setting) {
                handleInitChecked();
                handleCheckboxAll();
            },
            columns: column
        });
        return _datatable;
    }

    /**
     * init icheck
     */
    var handleInitChecked = function () {
        $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
            checkboxClass: 'icheckbox_minimal-blue',
            radioClass :'iradio_minimal-blue'
        });

        _masterCheckbox = $('input[type="checkbox"].minimal.icheck_master');
        _sonCheckbox = $('input[type="checkbox"].minimal');
    };


    /**
     * custom select function
     */
    var handleCheckboxAll = function () {
        _masterCheckbox.on("ifClicked", function (e) {
            if (e.target.checked) {
                _sonCheckbox.iCheck("uncheck");
            } else {
                _sonCheckbox.iCheck("check");
            }
        })
    }


    return {
        init: function () {
            handleInitChecked();
            handleCheckboxAll();

        },

        getCheckbox: function () {
            return _sonCheckbox;
        },

        initDatatables: function (url, column) {
            return handlePageFunction(url, column)
        }
    }
}();

$(document).ready(function () {
    Zoo.init();
});