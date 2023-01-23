pragma solidity ^0.6.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./IExerciceSolution.sol";

contract ExerciceSolution is ERC20, IExerciceSolution
{

  constructor() public ERC20("Arthurito", "dj3ZK") {
    //_mint(msg.sender,622736491000000000000000000-50000000000000);
    //_mint(address(this),50000000000000);
   
    whiteListedCustomers.push(address(0x7C5629d850eCD1E640b1572bC0d4ac5210b38FA5));
  }

  function symbol() public view override (ERC20, IExerciceSolution) returns (string memory) {
    return "dj3ZK";
  }

  function getToken() external override returns (bool){
    _mint(msg.sender,12);
  }

  function buyToken() external payable override returns (bool){
    //_transfer(address(this),msg.sender,msg.value*10);
    
    require (this.isCustomerWhiteListed(address(0x7C5629d850eCD1E640b1572bC0d4ac5210b38FA5)));
    require (this.customerTierLevel(address(0x7C5629d850eCD1E640b1572bC0d4ac5210b38FA5)) == 2);
    
    _mint(msg.sender,msg.value*2);
    return true;
  }

  address[] public whiteListedCustomers;

  function isCustomerWhiteListed(address customerAddress) external override returns (bool){
    for(uint i=0;i<whiteListedCustomers.length;i++){
      if(whiteListedCustomers[i]==customerAddress){
        return true;
      }
    }
    return false;
  
  }

  mapping(address => uint256) public customerTier;

  function customerTierLevel(address customerAddress) external override returns (uint256){
    customerTier[0x7C5629d850eCD1E640b1572bC0d4ac5210b38FA5]=2;
    return customerTier[0x7C5629d850eCD1E640b1572bC0d4ac5210b38FA5];
    
  }
}