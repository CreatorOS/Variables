# Variables

Variables are the basic building blocks of any programming language.
There are 3 types of variables in Solidity.

- Local
- State
- Global

## local variables

- declared inside a function
- not stored on the blockchain
- if modificaitions are made only to the local variables, the function can be modified to `view`.

```
    function doSomething() public {
        uint i = 456;
    }
```

## state variables

- declared outside a function
- stored on the blockchain database
- once a state variable is changed, the change will persist. The new updated value will be available to future calls.

```
    string public text = "Hello";
    uint public num = 123;
```

## global variables

- provides information about the blockchain
- These are populated by Ethereum for every function call. `block` and `msg` are some popular global variables. `block` represents information about the block (as in "block"chain) in which this transaction will be present. Every functioncall is a transaction and it must be present in a block to be considered as _executed_. `msg` is the object that is populated by Ethereum with information about the user calling a function. `msg.sender` is the user's address who called the function. `msg.value` is how much money was sent to this function - functions on Ethereum can accept money too in ETH.

```
    uint timestamp = block.timestamp; // Current block timestamp
    address sender = msg.sender; // address of the caller
```
