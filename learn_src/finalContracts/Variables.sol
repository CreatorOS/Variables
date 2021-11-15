// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Variables {
    function doSomething() public pure returns (uint256) {
        uint256 i = 456;
        return i;
    }

    string public text = "Hello";
    uint256 public num = 123;

    function setNum(uint256 number) public {
        num = number;
    }

    function getNum() public view returns (uint256) {
        return num;
    }

    uint256 public timestamp = block.timestamp; // Current block timestamp
    address public sender = msg.sender; // address of the caller

    function getSender() public view returns (address) {
        return msg.sender;
    }

    address public constant MY_ADDRESS =
        0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
    uint256 public constant MY_UINT = 123;

    address public immutable MY_ADDRESS2;
    uint256 public immutable MY_UINT2;

    constructor(uint256 _myUint) {
        MY_ADDRESS2 = msg.sender;
        MY_UINT2 = _myUint;
    }
}
