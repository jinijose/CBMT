pragma solidity ^0.4.17;
//import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";

contract CBMT{
    bytes32[] currencys;

    function CBMT() public {
        currencys.push("USD");
        currencys.push("INR");
        currencys.push("EUR");
    }
    
    function addNewCurrency(bytes32 cname) public returns(bool){
        require(!isExists(currencys,cname));
        currencys.push(cname);
        return true;
    }
    function viewCurrencys() view public returns(bytes32[] AllCurrencys){
        return currencys;
    }
    function TransferM(address to, uint256 value, bytes32 sourceCurrency, bytes32 destCurrency) public returns(bool){
        
    }
    function isExists(bytes32[] _arr, bytes32 _who) pure private returns (bool) {
        for (uint i = 0; i < _arr.length; i++) {
            if (_arr[i] == _who) {
                return true;
            }
        }
        return false;
    }
}
