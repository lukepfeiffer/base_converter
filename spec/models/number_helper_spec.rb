require 'rails_helper'

describe NumberHelper do
  describe "#invalid" do
    context "number is binary" do
      it "returns false" do
        number = "010110"
        expected = described_class.invalid(number, "2")
        expect(expected).to be false
      end

      it "returns true" do
        number = "0891"
        expected = described_class.invalid(number, "2")
        expect(expected).to be true
      end

      it "returns true" do
        number = "0ABE"
        expected = described_class.invalid(number, "2")
        expect(expected).to be true
      end
    end

    context "number is octal" do
      it "returns false" do
        number = "01234567"
        expected = described_class.invalid(number, "8")
        expect(expected).to be false
      end

      it "returns true" do
        number = "0891"
        expected = described_class.invalid(number, "8")
        expect(expected).to be true
      end

      it "returns true" do
        number = "0ABE"
        expected = described_class.invalid(number, "8")
        expect(expected).to be true
      end
    end

    context "number is decimal" do
      it "returns false" do
        number = "0123456789"
        expected = described_class.invalid(number, "10")
        expect(expected).to be false
      end

      it "returns true" do
        number = "0891A"
        expected = described_class.invalid(number, "10")
        expect(expected).to be true
      end

      it "returns true" do
        number = "0ABE"
        expected = described_class.invalid(number, "10")
        expect(expected).to be true
      end
    end

    context "number is hex" do
      it "returns false" do
        number = "0123456789ABCDEF"
        expected = described_class.invalid(number, "16")
        expect(expected).to be false
      end

      it "returns true" do
        number = "0891AG"
        expected = described_class.invalid(number, "16")
        expect(expected).to be true
      end

      it "returns true" do
        number = "0ABEGVC"
        expected = described_class.invalid(number, "16")
        expect(expected).to be true
      end
    end
  end

  describe "#to_decimal" do
    context "from binary" do
      it "returns valid number" do
        number1 = "0011"
        number2 = "011101"
        number3 = "11011"
        expected = described_class.convert(number1, "2", "10")
        expect( expected ).to eq("3")

        expected = described_class.convert(number2, "2", "10")
        expect( expected ).to eq("29")

        expected = described_class.convert(number3, "2", "10")
        expect( expected ).to eq("27")
      end
    end

    context "from octal" do
      it "returns valid number" do
        number1 = "7621"
        number2 = "2313"
        number3 = "214543"
        expected = described_class.convert(number1, "8", "10")
        expect( expected ).to eq("3985")

        expected = described_class.convert(number2, "8", "10")
        expect( expected ).to eq("1227")

        expected = described_class.convert(number3, "8", "10")
        expect( expected ).to eq("72035")
      end
    end

    context "from hex" do
      it "returns valid number" do
        number1 = "FFF"
        number2 = "ABC2"
        number3 = "EFb1"

        expected = described_class.convert(number1, "16", "10")
        expect( expected ).to eq("4095")

        expected = described_class.convert(number2, "16", "10")
        expect( expected ).to eq("43970")

        expected = described_class.convert(number3, "16", "10")
        expect( expected ).to eq("61361")
      end
    end
  end

  describe "#to_binary" do
    context "from decimal" do
      it "returns valid number" do
        number1 = "1232"
        number2 = "876"
        number3 = "2349"
        expected = described_class.convert(number1, "10", "2")
        expect( expected ).to eq("10011010000")

        expected = described_class.convert(number2, "10", "2")
        expect( expected ).to eq("1101101100")

        expected = described_class.convert(number3, "10", "2")
        expect( expected ).to eq("100100101101")
      end
    end

    context "from octal" do
      it "returns valid number" do
        number1 = "7621"
        number2 = "2313"
        number3 = "214543"
        expected = described_class.convert(number1, "8", "2")
        expect( expected ).to eq("111110010001")

        expected = described_class.convert(number2, "8", "2")
        expect( expected ).to eq("10011001011")

        expected = described_class.convert(number3, "8", "2")
        expect( expected ).to eq("10001100101100011")
      end
    end

    context "from hex" do
      it "returns valid number" do
        number1 = "FFF"
        number2 = "ABC2"
        number3 = "EFb1"

        expected = described_class.convert(number1, "16", "2")
        expect( expected ).to eq("111111111111")

        expected = described_class.convert(number2, "16", "2")
        expect( expected ).to eq("1010101111000010")

        expected = described_class.convert(number3, "16", "2")
        expect( expected ).to eq("1110111110110001")
      end
    end
  end

  describe "#to_octal" do
    context "from binary" do
      it "returns valid number" do
        number1 = "0011"
        number2 = "011101"
        number3 = "11011"
        expected = described_class.convert(number1, "2", "8")
        expect( expected ).to eq("3")

        expected = described_class.convert(number2, "2", "8")
        expect( expected ).to eq("35")

        expected = described_class.convert(number3, "2", "8")
        expect( expected ).to eq("33")
      end
    end

    context "from octal" do
      it "returns valid decimal" do
        number1 = "7621"
        number2 = "2313"
        number3 = "214543"
        expected = described_class.convert(number1, "10", "8")
        expect( expected ).to eq("16705")

        expected = described_class.convert(number2, "10", "8")
        expect( expected ).to eq("4411")

        expected = described_class.convert(number3, "10", "8")
        expect( expected ).to eq("643017")
      end
    end

    context "from hex" do
      it "returns valid number" do
        number1 = "FFF"
        number2 = "ABC2"
        number3 = "EFb1"

        expected = described_class.convert(number1, "16", "8")
        expect( expected ).to eq("7777")

        expected = described_class.convert(number2, "16", "8")
        expect( expected ).to eq("125702")

        expected = described_class.convert(number3, "16", "8")
        expect( expected ).to eq("167661")
      end
    end
  end

  describe "#to_hex" do
    context "from binary" do
      it "returns valid number" do
        number1 = "0011"
        number2 = "011101"
        number3 = "11011"
        expected = described_class.convert(number1, "2", "16")
        expect( expected ).to eq("3")

        expected = described_class.convert(number2, "2", "16")
        expect( expected ).to eq("1d")

        expected = described_class.convert(number3, "2", "16")
        expect( expected ).to eq("1b")
      end
    end

    context "from decimal" do
      it "returns valid decimal" do
        number1 = "7621"
        number2 = "2313"
        number3 = "214543"
        expected = described_class.convert(number1, "10", "16")
        expect( expected ).to eq("1dc5")

        expected = described_class.convert(number2, "10", "16")
        expect( expected ).to eq("909")

        expected = described_class.convert(number3, "10", "16")
        expect( expected ).to eq("3460f")
      end
    end

    context "from octal" do
      it "returns valid number" do
        number1 = "1273"
        number2 = "0234"
        number3 = "4565"

        expected = described_class.convert(number1, "8", "16")
        expect( expected ).to eq("2bb")

        expected = described_class.convert(number2, "8", "16")
        expect( expected ).to eq("9c")

        expected = described_class.convert(number3, "8", "16")
        expect( expected ).to eq("975")
      end
    end
  end

  describe "from base decimal to decimal number" do
    context "from is binary" do
      it "returns correct answer" do
        number1 = "0.11"
        number2 = "0.1101"
        number3 = "0.011"

        expected = described_class.float_to_decimal(number1, "2")
        expect( expected ).to eq("0.75")

        expected = described_class.float_to_decimal(number2, "2")
        expect( expected ).to eq("0.8125")

        expected = described_class.float_to_decimal(number3, "2")
        expect( expected ).to eq("0.375")

        expect( described_class.float_to_decimal("0.G2R", "2") ).to eq("NaN")
        expect( described_class.float_to_decimal("G2R", "2") ).to eq("NaN")
      end
    end

    context "from is hex" do
      it "returns correct answer" do
        number1 = "0.AB1"
        number2 = "0.913"
        number3 = "0.5E1"

        expected = described_class.float_to_decimal(number1, "16")
        expect( expected ).to eq("0.668212890625")

        expected = described_class.float_to_decimal(number2, "16")
        expect( expected ).to eq("0.567138671875")

        expected = described_class.float_to_decimal(number3, "16")
        expect( expected ).to eq("0.367431640625")

        expect( described_class.float_to_decimal("0.G2R", "16") ).to eq("NaN")
        expect( described_class.float_to_decimal("G2R", "16") ).to eq("NaN")
      end
    end

    context "from is oct" do
      it "returns correct answer" do
        number1 = "0.736"
        number2 = "0.231"
        number3 = "0.417"

        expected = described_class.float_to_decimal(number1, "8")
        expect( expected ).to eq("0.93359375")

        expected = described_class.float_to_decimal(number2, "8")
        expect( expected ).to eq("0.298828125")

        expected = described_class.float_to_decimal(number3, "8")
        expect( expected ).to eq("0.529296875")

        expect( described_class.float_to_decimal("0.G2R", "8") ).to eq("NaN")
        expect( described_class.float_to_decimal("G2R", "8") ).to eq("NaN")
      end
    end
  end
end
