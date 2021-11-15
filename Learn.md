# Variables

Variables are the basic building blocks of any programming language.
There are 3 types of variables in Solidity.

- Local
- State
- Global

## local variables

Local Variables

- declared inside a function
- not stored on the blockchain
- if modifications are made only to the local variables, the function can be modified to `pure` - because it doesn't update the contract variables aka state.
- In below case it doesn't even view the state variables so it can be modified to `pure`

```
    function doSomething() public pure returns(uint){
        uint i = 456;
        return i;
    }
```

Hit `Run` and check logs in test output 1. It should show `456`.

## state variables

State Variables

- declared outside a function
- stored on the blockchain database
- once a state variable is changed, the change will persist. The new updated value will be available to future function calls.

```
    string public text = "Hello";
    uint public num = 123;
    function setNum(uint number) public {
      num = number;
    }
    function getNum() public view returns(uint) {
      return num;
    }
```

Hit `Run` and check logs in test output 2. It should show `123` for `getNum()`.
In test output 3, the `setNum()` function is called and the `num` variable is updated to `3`.

## global variables

Global Variables

- provides information about the blockchain
- These are populated by Ethereum for every function call. `block` and `msg` are some popular global variables.
- `block` represents information about the block (as in "block"chain) in which this transaction will be present. Every functioncall is a transaction and it must be present in a block to be considered as _executed_. `msg` is the object that is populated by Ethereum with information about the user calling a function.
- `msg.sender` is the user's address who called the function. `msg.value` is how much money was sent to this function - functions on Ethereum can accept money too in ETH.

```
    uint timestamp = block.timestamp; // Current block timestamp
    address sender = msg.sender; // address of the caller
    function getSender() public view returns(address){
      return msg.sender;
    }
```

Hit `Run` and check logs in test output 4. It should show `msg.sender` value after calling `getSender()`.
In test output 5, you will see the `timestamp` and `sender` values.

## Constants

Constants

Constants are variables that cannot be modified.

Their value is hard coded and using constants can save gas cost.

- It coding convention is to use all caps for constants.

```
    address public constant MY_ADDRESS = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
    uint public constant MY_UINT = 123;
```

Hit `Run` to see the values of `MY_ADDRESS` and `MY_UINT` in test output 6.

## Immutable

Immuntable

Immutable variables are like constants.
Values of immutable variables can be set inside the constructor but cannot be modified afterwards.
The constructor is called exactly once when the contract is deployed.

- Helpful for setting constant variables at time of deployment and not hardcoding like in case of `constant`.

```
    address public immutable MY_ADDRESS2;
    uint public immutable MY_UINT2;

    constructor(uint _myUint) {
        MY_ADDRESS2 = msg.sender;
        MY_UINT2 = _myUint;
    }
```

Hit `Run` to see the values of `MY_ADDRESS2` and `MY_UINT2` in test output 7.
Other tests might fail at this point but don't worry that's because we modified the constructor to include a parameter which we are not passing in previous states.
