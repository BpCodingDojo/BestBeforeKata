describe("BestBefore", function() {

    describe("getPessimisticDate", function() {

        var dataProvider = [
            { it: 'should handle date with one digit', input: '1/1/1', output: '2001-01-01' },
            { it: 'TO DELETE: should convert to the output format', input: '2/2/2', output: '2002-02-02' },
            { it: 'should handle date with two digits', input: '10/10/10', output: '2010-10-10' },
            { it: 'should handle a four digit year in the first part', input: '2111/10/10', output: '2111-10-10' },
        ];

        dataProvider.forEach(function(testCase) {
            it(testCase.it, function() {
                var bestBefore = new BestBefore(testCase.input);
                expect(bestBefore.getPessimisticDate()).toEqual(testCase.output);
            });
        });

    });
});