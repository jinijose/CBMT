pragma solidity ^0.4.17;
//import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";

contract CBMT{
    string[] currencys;
    uint256 tid;
    mapping(uint256 => tran) _trans;
    
    struct tran{
        uint256 id;
        address to;
        bytes32 sourceCurrency;
        bytes32 destCurrency;
        bytes32 value;
        bytes32 conversionRate;
        
    }
    function CBMT() public {
        currencys.push("USD");
        currencys.push("INR");
        currencys.push("EUR");
    }
    
    function addNewCurrency(string cname) public returns(bool){
        require(!isExists(currencys,cname));
        currencys.push(cname);
        return true;
    }/*
    function viewCurrencys() view public returns(string[] AllCurrencys){
        return currencys;
    }*/
    function TransferM(address to, uint256 value, string sourceCurrency, string destCurrency) public returns(bool){
        require(isExists(currencys,sourceCurrency));
        require(isExists(currencys,destCurrency));
        
        
    }
    
    function __callback(bytes32 myid, string result) {
        //if (msg.sender != oraclize_cbAddress()) throw;
        
        //DieselPriceUSD = parseInt(result, 2); // let's save it as $ cents
        // do something with the USD Diesel price
    }
    function showString(bytes32 x) public view returns(string){
        return bytes32ToString(x);
    }
    function getRate(string sourceCurrency, string destCurrency) payable {
        //string memory sCur;
        //string memory dCur;
        //sCur = bytes32ToString(sourceCurrency);
        //dCur = bytes32ToString(destCurrency);
        //newOraclizeQuery("Oraclize query was sent, standing by for the answer..");
        //oraclize_query("URL", "xml(http://free.currencyconverterapi.com/api/v5/convert?q=USD_INR&compact=y");
    }
    function isExists(string[] _arr, string _what) pure private returns (bool) {
        for (uint i = 0; i < _arr.length; i++) {
            if (keccak256(_arr[i]) == keccak256(_what)) {
                return true;
            }
        }
        return false;
    }
    function bytes32ToString(bytes32 x) constant returns (string) {
        bytes memory bytesString = new bytes(32);
        uint charCount = 0;
        for (uint j = 0; j < 32; j++) {
            byte char = byte(bytes32(uint(x) * 2 ** (8 * j)));
            if (char != 0) {
                bytesString[charCount] = char;
                charCount++;
            }
        }
        bytes memory bytesStringTrimmed = new bytes(charCount);
        for (j = 0; j < charCount; j++) {
            bytesStringTrimmed[j] = bytesString[j];
        }
        return string(bytesStringTrimmed);
    }
}
