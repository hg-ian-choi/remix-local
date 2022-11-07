// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "./IFactory.sol";
import "@openzeppelin/contracts/proxy/Clones.sol";

contract TestFactory {
    using Clones for address;

    address public owner;
    address public origin;

    event NewClone(address _newClone, address _owner);

    modifier onlyOwner() {
        require(owner == msg.sender, "ERROR: Only Owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function setOrigin(address _origin) public onlyOwner {
        origin = _origin;
    }

    function clone() external returns (address identicalChild) {
        identicalChild = origin.clone();
        IFactory(identicalChild).initialize(msg.sender);
        emit NewClone(identicalChild, msg.sender);
    }
}
