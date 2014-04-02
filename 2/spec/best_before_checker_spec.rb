require_relative "../lib/best_before_checker"

describe BestBeforeChecker do
  describe "#earliest_date_for" do

    context "when date is in YYYY/MM/DD format" do
      it "should recognize illegal dates" do
        expect(subject.earliest_date_for "2073/09/31").to eq "2073/09/31 is illegal"
      end

      it "should recognize legal dates" do
        expect(subject.earliest_date_for "2073/09/30").not_to include "illegal"
      end

    end


    context "when date can be interpreted only one way" do
      [
        {format: "YYYY/DD/MM", input: "2073/30/09"},
        {format: "YYYY/MM/DD", input: "2073/09/30"},
        {format: "DD/YYYY/MM", input: "30/2073/09"},
        {format: "MM/YYYY/DD", input: "09/2073/30"},
        {format: "DD/MM/YYYY", input: "30/09/2073"},
        {format: "MM/DD/YYYY", input: "09/30/2073"},
      ]
      .each do |testcase|
        it "should recognize #{testcase[:format]} format as valid date" do
          expect(subject.earliest_date_for testcase[:input]).to eq "2073-09-30"
        end
      end
    end


    context "when date can be interpreted multiple ways" do
      it "should return earliest valid interpretation" do
        expect(subject.earliest_date_for "2014/04/02").to eq "2014-02-04"
      end
    end


    it "should not mind if no zero padding is present" do
      expect(subject.earliest_date_for "2014/4/2").to eq "2014-02-04"
    end

  end
end
