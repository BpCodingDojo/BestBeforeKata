(function(exports) {

    var BestBefore = function(date) {
        this.date = date;
    };

    BestBefore.prototype.getPessimisticDate = function() {
        var split_date = this.date.split("/");

        return (new SimpleDate(split_date[0], split_date[1], split_date[2])).format();
    };

    var SimpleDate = function(year, month, day) {
        this.year = year;
        this.month = month;
        this.day = day;
    };

    SimpleDate.prototype.format = function() {
        return SimpleDateFormatter.convertToFourDigitYear(this.year) + "-" +
               SimpleDateFormatter.paddingToTwoDigits(this.month) + "-" +
               SimpleDateFormatter.paddingToTwoDigits(this.day);
    };

    var SimpleDateFormatter = {
        paddingToTwoDigits: function(number) {
            return String('0' + number).slice(-2);
        },

        paddingToFourDigitYear: function(year) {
            return "20" + this.paddingToTwoDigits(year);
        },

        convertToFourDigitYear: function(year) {
            return year.length === 4 ? year : this.paddingToFourDigitYear(year);
        }
    };


    exports.BestBefore = BestBefore;
}(window));